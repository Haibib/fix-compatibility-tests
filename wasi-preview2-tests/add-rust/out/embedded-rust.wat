(module $rust_comp_model.wasm
  (type (;0;) (func (param i32) (result i32)))
  (table (;0;) 1 1 funcref)
  (memory (;0;) 16)
  (global $__stack_pointer (;0;) (mut i32) i32.const 1048576)
  (global (;1;) i32 i32.const 1048576)
  (global (;2;) i32 i32.const 1048576)
  (export "memory" (memory 0))
  (export "run" (func $run))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (func $run (;0;) (type 0) (param i32) (result i32)
    local.get 0
    i32.const 7
    i32.add
  )
  (@producers
    (language "Rust" "")
    (processed-by "rustc" "1.96.1 (31fca3adb 2026-06-26)")
  )
  (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
  (@custom "component-type" (after code) "\00asm\0d\00\01\00\00\19\16wit-component-encoding\04\00\07:\01A\02\01A\02\01@\01\01xy\00y\04\00\03run\01\00\04\00\1fexample:my-component/rust-world\04\00\0b\10\01\00\0arust-world\03\00\00\00/\09producers\01\0cprocessed-by\01\0dwit-component\070.253.0")
)
