(component
  (core module $main (;0;)
    (type (;0;) (func (param i32) (result i32)))
    (export "local:library-example/library#add" (func 0))
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
  (alias core export $main "local:library-example/library#add" (core func $local:library-example/library#add (;0;)))
  (func $add (;0;) (type 0) (canon lift (core func $local:library-example/library#add)))
  (component $local:library-example/library-shim-component (;0;)
    (type (;0;) (func (param "x" s32) (result s32)))
    (import "import-func-add" (func (;0;) (type 0)))
    (type (;1;) (func (param "x" s32) (result s32)))
    (export (;1;) "add" (func 0) (func (type 1)))
  )
  (instance $local:library-example/library-shim-instance (;0;) (instantiate $local:library-example/library-shim-component
      (with "import-func-add" (func $add))
    )
  )
  (export $local:library-example/library (;1;) "local:library-example/library" (instance $local:library-example/library-shim-instance))
  (@producers
    (processed-by "wit-component" "0.253.0")
  )
)
