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
  (@custom "component-type" (after code) "\00asm\0d\00\01\00\00\19\16wit-component-encoding\04\00\07o\01A\02\01A\04\01B\02\01@\01\01xz\00z\04\00\03add\01\00\03\00\1dlocal:library-example/library\05\00\01@\00\00z\04\00\04main\01\01\04\00!local:driver-example/driver-world\04\00\0b\12\01\00\0cdriver-world\03\00\00\00/\09producers\01\0cprocessed-by\01\0dwit-component\070.253.0")
)
