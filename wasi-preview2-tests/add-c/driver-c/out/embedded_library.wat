(module
  (type (;0;) (func (param i32) (result i32)))
  (export "local:library-example/library#add" (func 0))
  (func (;0;) (type 0) (param i32) (result i32)
    local.get 0
    i32.const 7
    i32.add
  )
  (@custom "target_features" (after code) "\06+\0fmutable-globals+\13nontrapping-fptoint+\0bbulk-memory+\08sign-ext+\0freference-types+\0amultivalue")
  (@custom "component-type" (after code) "\00asm\0d\00\01\00\00\19\16wit-component-encoding\04\00\07c\01A\02\01A\02\01B\02\01@\01\01xz\00z\04\00\03add\01\00\04\00\1dlocal:library-example/library\05\00\04\00#local:library-example/library-world\04\00\0b\13\01\00\0dlibrary-world\03\00\00\00/\09producers\01\0cprocessed-by\01\0dwit-component\070.253.0")
)
