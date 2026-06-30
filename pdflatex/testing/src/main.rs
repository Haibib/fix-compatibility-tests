use anyhow::Result;
use wasmtime::{Engine, Linker, Module, Store};
use wasmtime_wasi::{
    p1::{self, WasiP1Ctx},
    WasiCtxBuilder,
};

fn main() -> Result<()> {
    let engine = Engine::default();
    let module = Module::from_file(&engine, "guest.wasm")?;

    // Forward only the user's args to the guest.
    let args: Vec<String> = std::env::args().skip(1).collect();

    let wasi = WasiCtxBuilder::new()
        .inherit_stdio()
        .args(&args)
        .build_p1();

    let mut linker: Linker<WasiP1Ctx> = Linker::new(&engine);
    p1::add_to_linker_sync(&mut linker, |cx| cx)?;

    let mut store = Store::new(&engine, wasi);
    let instance = linker.instantiate(&mut store, &module)?;

    let start = instance.get_typed_func::<(), ()>(&mut store, "_start")?;
    start.call(&mut store, ())?;

    Ok(())
}








/*use anyhow::{anyhow, Result};
use wasmtime::{Caller, Engine, Extern, Linker, Memory, Module, Store};
use wasmtime_wasi::{
    p1::{self, WasiP1Ctx},
    WasiCtxBuilder,
};
use wasmtime_wasi::{DirPerms, FilePerms};
use std::path::PathBuf;

struct HostState {
    wasi: WasiP1Ctx,
    args: Vec<String>,
}

fn memory(caller: &mut Caller<'_, HostState>) -> Result<Memory> {
    match caller.get_export("memory") {
        Some(Extern::Memory(mem)) => Ok(mem),
        _ => Err(anyhow!("guest memory export not found")),
    }
}

fn write_u32(mem: &Memory, caller: &mut Caller<'_, HostState>, offset: usize, v: u32) -> Result<()> {
    mem.write(caller, offset, &v.to_le_bytes())?;
    Ok(())
}

fn main() -> Result<()> {
    let engine = Engine::default();
    let module = Module::from_file(&engine, "tex")?;

    let mut args: Vec<String> = vec!["tex".to_string(), "hello.tex".to_string()]; // or "pdflatex" / "tex"
    args.extend(std::env::args().skip(1));

    let cwd = std::env::current_dir()?;

    let wasi = WasiCtxBuilder::new()
        .inherit_stdio()
        .inherit_env()
        .args(&["./tex".to_string(), "hello.tex".to_string()])
        .initial_cwd(".")
        .preopened_dir(cwd, ".", DirPerms::all(), FilePerms::all())?
        .preopened_dir(
            PathBuf::from("/home/saibi/fix-project/fix-compatibility-tests/pdflatex/texlive-source"),
            "/share",
            DirPerms::READ,
            FilePerms::READ,
        )?
        .build_p1();

    let mut linker: Linker<HostState> = Linker::new(&engine);
    linker.allow_shadowing(true);

    // Add the normal WASI functions first.
    p1::add_to_linker_sync(&mut linker, |s: &mut HostState| &mut s.wasi)?;

    // Replace only the argv-related imports with logging wrappers.
    linker.func_wrap(
        "wasi_snapshot_preview1",
        "args_sizes_get",
        |mut caller: Caller<'_, HostState>, argc_ptr: i32, argv_buf_size_ptr: i32| -> i32 {
            eprintln!("TeX called args_sizes_get()");

            let args = caller.data().args.clone();

            let argc = args.len() as u32;
            let argv_buf_size: u32 =
                args.iter().map(|s| s.len() as u32 + 1).sum();

            let mem = match memory(&mut caller) {
                Ok(m) => m,
                Err(e) => {
                    eprintln!("memory error: {e}");
                    return 1; // WASI errno
                }
            };

            if write_u32(&mem, &mut caller, argc_ptr as usize, argc).is_err() {
                return 1;
            }

            if write_u32(
                &mem,
                &mut caller,
                argv_buf_size_ptr as usize,
                argv_buf_size,
            )
            .is_err()
            {
                return 1;
            }

            0
        },
    )?;

    linker.func_wrap(
        "wasi_snapshot_preview1",
        "args_get",
        |mut caller: Caller<'_, HostState>, argv_ptr: i32, argv_buf_ptr: i32| -> i32 {
            eprintln!("TeX called args_get()");

            let args = caller.data().args.clone();

            let mem = match memory(&mut caller) {
                Ok(m) => m,
                Err(e) => {
                    eprintln!("memory error: {e}");
                    return 1;
                }
            };

            let mut buf_cursor = argv_buf_ptr as usize;

            for (i, arg) in args.iter().enumerate() {
                let ptr_loc = argv_ptr as usize + i * 4;

                if write_u32(
                    &mem,
                    &mut caller,
                    ptr_loc,
                    buf_cursor as u32,
                )
                .is_err()
                {
                    return 1;
                }

                if mem.write(&mut caller, buf_cursor, arg.as_bytes()).is_err() {
                    return 1;
                }

                if mem
                    .write(&mut caller, buf_cursor + arg.len(), &[0])
                    .is_err()
                {
                    return 1;
                }

                buf_cursor += arg.len() + 1;
            }

            0
        },
    )?;

    let mut store = Store::new(&engine, HostState { wasi, args });
    let instance = linker.instantiate(&mut store, &module)?;

    let start = instance.get_typed_func::<(), ()>(&mut store, "_start")?;
    start.call(&mut store, ())?;

    Ok(())
}*/









/*use anyhow::Result;
use wasmtime::{Caller, Engine, Linker, Module, Store};

#[derive(Default)]
struct State {
    args: Vec<String>,
}

fn main() -> Result<()> {
    let engine = Engine::default();
    let mut linker = Linker::new(&engine);

    // args_sizes_get(argc_ptr, argv_buf_size_ptr) -> errno
    linker.func_wrap(
        "wasi_snapshot_preview1",
        "args_sizes_get",
        |mut caller: Caller<'_, State>, argc_ptr: i32, argv_buf_size_ptr: i32| -> i32 {
            let Some(mem) = caller.get_export("memory").and_then(|e| e.into_memory()) else {
                return 1;
            };

            let args = caller.data().args.clone();
            let argc: u32 = args.len() as u32;
            let argv_buf_size: u32 = args.iter().map(|s| (s.len() + 1) as u32).sum();

            if mem.write(&mut caller, argc_ptr as usize, &argc.to_le_bytes()).is_err() {
                return 1;
            }
            if mem
                .write(&mut caller, argv_buf_size_ptr as usize, &argv_buf_size.to_le_bytes())
                .is_err()
            {
                return 1;
            }
            0
        },
    )?;

    // args_get(argv_ptr, argv_buf_ptr) -> errno
    linker.func_wrap(
        "wasi_snapshot_preview1",
        "args_get",
        |mut caller: Caller<'_, State>, argv_ptr: i32, argv_buf_ptr: i32| -> i32 {
            let Some(mem) = caller.get_export("memory").and_then(|e| e.into_memory()) else {
                return 1;
            };

            let args = caller.data().args.clone();
            let mut buf_off = argv_buf_ptr as usize;

            for (i, arg) in args.iter().enumerate() {
                let ptr = buf_off as u32;

                if mem
                    .write(&mut caller, argv_ptr as usize + i * 4, &ptr.to_le_bytes())
                    .is_err()
                {
                    return 1;
                }

                if mem.write(&mut caller, buf_off, arg.as_bytes()).is_err() {
                    return 1;
                }
                buf_off += arg.len();

                if mem.write(&mut caller, buf_off, &[0]).is_err() {
                    return 1;
                }
                buf_off += 1;
            }

            0
        },
    )?;

    let module = Module::from_file(&engine, "guest.wasm")?;
    let mut store = Store::new(
        &engine,
        State {
            args: vec!["demo".into(), "one".into(), "two".into()],
        },
    );

    let instance = linker.instantiate(&mut store, &module)?;
    let start = instance.get_typed_func::<(), ()>(&mut store, "_start")?;
    start.call(&mut store, ())?;
    Ok(())
}

/*
use anyhow::Result;
use wasmtime::{Engine, Linker, Module, Store};
use wasmtime_wasi::WasiCtx;

const GUEST_WAT: &str = r#"
(module
  (type $args_t (func (param i32 i32) (result i32)))
  (type $fdwrite_t (func (param i32 i32 i32 i32) (result i32)))

  (import "wasi_snapshot_preview1" "args_sizes_get" (func $args_sizes_get (type $args_t)))
  (import "wasi_snapshot_preview1" "args_get" (func $args_get (type $args_t)))
  (import "wasi_snapshot_preview1" "fd_write" (func $fd_write (type $fdwrite_t)))

  (memory (export "memory") 2)

  ;; usize -> length of NUL-terminated string at address `p`
  (func $strlen (param $p i32) (result i32)
    (local $len i32)
    (block $done
      (loop $loop
        local.get $p
        local.get $len
        i32.add
        i32.load8_u
        i32.eqz
        br_if $done

        local.get $len
        i32.const 1
        i32.add
        local.set $len
        br $loop
      )
    )
    local.get $len
  )

  ;; Write `len` bytes from `ptr` to stdout.
  (func $print (param $ptr i32) (param $len i32)
    ;; iovec { buf, len }
    i32.const 1000
    local.get $ptr
    i32.store
    i32.const 1004
    local.get $len
    i32.store

    ;; fd_write(1, &iovec, 1, &written)
    i32.const 1
    i32.const 1000
    i32.const 1
    i32.const 1008
    call $fd_write
    drop
  )

  ;; newline
  (data (i32.const 2000) "\0a")

  (func (export "_start")
    (local $argc i32)
    (local $i i32)
    (local $argptr i32)
    (local $arglen i32)

    ;; Ask WASI for argc / argv_buf_size.
    i32.const 0
    i32.const 4
    call $args_sizes_get
    drop

    ;; argc is written at memory[0..4)
    i32.const 0
    i32.load
    local.set $argc

    ;; Write argv pointers at 8, argv strings at 4096.
    i32.const 8
    i32.const 4096
    call $args_get
    drop

    local.get $argc
    i32.const 0
    i32.lt_u
    drop

    i32.const 0
    local.set $i

    block $exit
      loop $loop
        local.get $i
        local.get $argc
        i32.ge_u
        br_if $exit

        ;; load argv[i]
        i32.const 8
        local.get $i
        i32.const 4
        i32.mul
        i32.add
        i32.load
        local.set $argptr

        ;; strlen(argv[i])
        local.get $argptr
        call $strlen
        local.set $arglen

        ;; print argv[i]
        local.get $argptr
        local.get $arglen
        call $print

        ;; print '\n'
        i32.const 2000
        i32.const 1
        call $print

        local.get $i
        i32.const 1
        i32.add
        local.set $i
        br $loop
      end
    end
  )
)
"#;

fn main() -> Result<()> {
    let engine = Engine::default();
    let mut linker = Linker::new(&engine);

    // Wires up WASI Preview 1 imports like args_get / args_sizes_get.
    wasmtime_wasi::p1::add_to_linker_sync(&mut linker, |s| s)?;

    // Embed the guest module directly in this file.
    let wasm_bytes = wat::parse_str(GUEST_WAT)?;
    let module = Module::new(&engine, wasm_bytes)?;

    // Pass the process args and connect stdout/stderr.
    let wasi = WasiCtx::builder()
        .inherit_args()
        .inherit_stdio()
        .build_p1();

    let mut store = Store::new(&engine, wasi);

    let instance = linker.instantiate(&mut store, &module)?;
    let start = instance.get_typed_func::<(), ()>(&mut store, "_start")?;
    start.call(&mut store, ())?;

    Ok(())
} 
*/
*/