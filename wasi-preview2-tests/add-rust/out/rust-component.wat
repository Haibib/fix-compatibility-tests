(component
  (core module $main (;0;)
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
      (processed-by "wit-component" "0.253.0")
    )
    (@custom "target_features" (after code) "\08+\0bbulk-memory+\0fbulk-memory-opt+\16call-indirect-overlong+\0amultivalue+\0fmutable-globals+\13nontrapping-fptoint+\0freference-types+\08sign-ext")
  )
  (core instance $main (;0;) (instantiate $main))
  (alias core export $main "memory" (core memory $memory (;0;)))
  (type (;0;) (func (param "x" u32) (result u32)))
  (alias core export $main "run" (core func $run (;0;)))
  (func $run (;0;) (type 0) (canon lift (core func $run)))
  (export $"#func1 run" (@name "run") (;1;) "run" (func $run))
  (@producers
    (processed-by "wit-component" "0.253.0")
  )
)
