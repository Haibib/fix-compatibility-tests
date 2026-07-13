(module
  (type (;0;) (func (param i32) (result i32)))
  (type (;1;) (func (result i32)))
  (import "local:library-example/library" "add" (func (;0;) (type 0)))
  (export "main" (func 1))
  (func (;1;) (type 1) (result i32)
    i32.const 5
    call 0
  )
  (@custom "target_features" (after code) "\06+\0fmutable-globals+\13nontrapping-fptoint+\0bbulk-memory+\08sign-ext+\0freference-types+\0amultivalue")
)
