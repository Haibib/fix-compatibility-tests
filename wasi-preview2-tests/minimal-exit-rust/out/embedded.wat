(module $exit-module.wasm
  (type (;0;) (func (param i32)))
  (type (;1;) (func (result i32)))
  (import "wasi:cli/exit@0.2.0" "exit" (func $_ZN4main9wasi_exit17h08a95b210735e526E (;0;) (type 0)))
  (memory (;0;) 16)
  (global $__stack_pointer (;0;) (mut i32) i32.const 1048576)
  (global (;1;) i32 i32.const 1048576)
  (global (;2;) i32 i32.const 1048576)
  (export "memory" (memory 0))
  (export "wasi:cli/run@0.2.0#run" (func $wasi:cli/run@0.2.0#run))
  (export "__data_end" (global 1))
  (export "__heap_base" (global 2))
  (func $wasi:cli/run@0.2.0#run (;1;) (type 1) (result i32)
    i32.const 0
    call $_ZN4main9wasi_exit17h08a95b210735e526E
    i32.const 0
  )
  (@producers
    (language "Rust" "")
    (processed-by "rustc" "1.96.1 (31fca3adb 2026-06-26)")
  )
  (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
  (@custom "component-type" (after code) "\00asm\0d\00\01\00\00\19\16wit-component-encoding\04\00\07\87\01\01A\02\01A\04\01B\03\01j\00\00\01@\01\06status\00\01\00\04\00\04exit\01\01\03\00\13wasi:cli/exit@0.2.0\05\00\01B\03\01j\00\00\01@\00\00\00\04\00\03run\01\01\04\00\12wasi:cli/run@0.2.0\05\01\04\00\1cexample:minimal-exit/minimal\04\00\0b\0d\01\00\07minimal\03\00\00\00/\09producers\01\0cprocessed-by\01\0dwit-component\070.253.0")
)
