(component
  (core module $main (;0;)
    (type (;0;) (func (param i32) (result i32)))
    (export "add" (func 0))
    (func (;0;) (type 0) (param i32) (result i32)
      local.get 0
      i32.const 7
      i32.add
    )
    (@custom "target_features" (after code) "\06+\0fmutable-globals+\13nontrapping-fptoint+\0bbulk-memory+\08sign-ext+\0freference-types+\0amultivalue")
    (@producers
      (processed-by "wit-component" "0.253.0")
    )
  )
  (core instance $main (;0;) (instantiate $main))
  (type (;0;) (func (param "x" s32) (result s32)))
  (alias core export $main "add" (core func $add (;0;)))
  (func $add (;0;) (type 0) (canon lift (core func $add)))
  (export $"#func1 add" (@name "add") (;1;) "add" (func $add))
  (@producers
    (processed-by "wit-component" "0.253.0")
  )
)
