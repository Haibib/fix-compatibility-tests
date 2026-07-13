(module
  (type (;0;) (func (param i32) (result i32)))
  (export "local:library-example/library#add" (func 0))
  (func (;0;) (type 0) (param i32) (result i32)
    local.get 0
    i32.const 7
    i32.add
  )
  (@custom "target_features" (after code) "\06+\0fmutable-globals+\13nontrapping-fptoint+\0bbulk-memory+\08sign-ext+\0freference-types+\0amultivalue")
)
