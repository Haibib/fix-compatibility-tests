use std::ffi::CStr;
use std::ptr;

fn main() {
    unsafe {
        let mut argc: u32 = 0;
        let mut argv_buf_size: u32 = 0;

        let err = importertest::wasi_imports::args_sizes_get(&mut argc, &mut argv_buf_size);
        if err != 0 {
            eprintln!("args_sizes_get failed with error code {err}");
            std::process::exit(1);
        }

        let mut argv: Vec<*mut u8> = vec![ptr::null_mut(); argc as usize];
        let mut argv_buf: Vec<u8> = vec![0; argv_buf_size as usize];

        let err = importertest::wasi_imports::args_get(argv.as_mut_ptr(), argv_buf.as_mut_ptr());
        if err != 0 {
            eprintln!("args_get failed with error code {err}");
            std::process::exit(1);
        }

        for i in 0..argc as usize {
            let c_str = CStr::from_ptr(argv[i] as *const i8);
            println!("{}", c_str.to_string_lossy());
        }

        // Keep argv_buf alive until after we finish reading argv pointers.
        let _ = argv_buf;
    }
}

