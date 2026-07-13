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
)
