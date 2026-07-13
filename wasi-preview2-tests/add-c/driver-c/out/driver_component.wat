(component
  (type $ty-local:library-example/library (;0;)
    (instance
      (type (;0;) (func (param "x" s32) (result s32)))
      (export (;0;) "add" (func (type 0)))
    )
  )
  (import "local:library-example/library" (instance $local:library-example/library (;0;) (type $ty-local:library-example/library)))
  (core module $main (;0;)
    (type (;0;) (func (param i32) (result i32)))
    (type (;1;) (func (result i32)))
    (import "local:library-example/library" "add" (func (;0;) (type 0)))
    (export "main" (func 1))
    (func (;1;) (type 1) (result i32)
      i32.const 5
      call 0
    )
    (@custom "target_features" (after code) "\06+\0fmutable-globals+\13nontrapping-fptoint+\0bbulk-memory+\08sign-ext+\0freference-types+\0amultivalue")
    (@producers
      (processed-by "wit-component" "0.253.0")
    )
  )
  (alias export $local:library-example/library "add" (func $add (;0;)))
  (core func $add (;0;) (canon lower (func $add)))
  (core instance $local:library-example/library (;0;)
    (export "add" (func $add))
  )
  (core instance $main (;1;) (instantiate $main
      (with "local:library-example/library" (instance $local:library-example/library))
    )
  )
  (type (;1;) (func (result s32)))
  (alias core export $main "main" (core func $main (;1;)))
  (func $main (;1;) (type 1) (canon lift (core func $main)))
  (export $"#func2 main" (@name "main") (;2;) "main" (func $main))
  (@producers
    (processed-by "wit-component" "0.253.0")
  )
)
