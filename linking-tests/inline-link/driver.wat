(module $driver.wasm
  (type (;0;) (func (param i32)))
  (type (;1;) (func (result i32)))
  (type (;2;) (func (param i32 i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32)))
  (func $_RNvCsdmzQVjkR6EO_7___rustc17rust_begin_unwind (type 0) (param i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 1
    local.get 1
    local.get 0
    i32.store offset=12
    loop  ;; label = @1
      br 0 (;@1;)
    end)
  (func $__original_main (type 1) (result i32)
    (local i32 i32 i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 0
    local.get 0
    global.set $__stack_pointer
    i32.const 1
    i32.const 3
    call $args_sizes_get
    local.set 1
    local.get 0
    local.get 1
    i32.store offset=8
    i32.const 2
    i32.const 4
    call $args_get
    local.set 2
    local.get 0
    local.get 2
    i32.store offset=12
    local.get 2
    i32.const 0
    i32.lt_s
    local.set 3
    local.get 1
    local.get 2
    i32.add
    local.set 4
    block  ;; label = @1
      local.get 3
      local.get 4
      local.get 1
      i32.lt_s
      i32.xor
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      local.get 0
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
      return
    end
    i32.const 1048596
    call $_RNvNtNtCs8lg16XUPpM_4core9panicking11panic_const24panic_const_add_overflow
    unreachable)
  (func $main (type 2) (param i32 i32) (result i32)
    call $__original_main
    return)
  (func $args_get (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    local.get 1
    i32.store offset=12
    local.get 1
    i32.const 0
    i32.lt_s
    local.set 3
    local.get 0
    local.get 1
    i32.add
    local.set 4
    block  ;; label = @1
      local.get 3
      local.get 4
      local.get 0
      i32.lt_s
      i32.xor
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
      return
    end
    i32.const 1048632
    call $_RNvNtNtCs8lg16XUPpM_4core9panicking11panic_const24panic_const_add_overflow
    unreachable)
  (func $args_sizes_get (type 2) (param i32 i32) (result i32)
    (local i32 i32 i32)
    global.get $__stack_pointer
    i32.const 16
    i32.sub
    local.set 2
    local.get 2
    global.set $__stack_pointer
    local.get 2
    local.get 0
    i32.store offset=8
    local.get 2
    local.get 1
    i32.store offset=12
    local.get 1
    i32.const 0
    i32.lt_s
    local.set 3
    local.get 0
    local.get 1
    i32.add
    local.set 4
    block  ;; label = @1
      local.get 3
      local.get 4
      local.get 0
      i32.lt_s
      i32.xor
      i32.const 1
      i32.and
      br_if 0 (;@1;)
      local.get 2
      i32.const 16
      i32.add
      global.set $__stack_pointer
      local.get 4
      return
    end
    i32.const 1048648
    call $_RNvNtNtCs8lg16XUPpM_4core9panicking11panic_const24panic_const_add_overflow
    unreachable)
  (func $_RNvNtCs8lg16XUPpM_4core9panicking9panic_fmt (type 3) (param i32 i32 i32)
    (local i32)
    global.get $__stack_pointer
    i32.const 32
    i32.sub
    local.tee 3
    global.set $__stack_pointer
    local.get 3
    local.get 1
    i32.store offset=16
    local.get 3
    local.get 0
    i32.store offset=12
    local.get 3
    i32.const 1
    i32.store16 offset=28
    local.get 3
    local.get 2
    i32.store offset=24
    local.get 3
    local.get 3
    i32.const 12
    i32.add
    i32.store offset=20
    local.get 3
    i32.const 20
    i32.add
    call $_RNvCsdmzQVjkR6EO_7___rustc17rust_begin_unwind
    unreachable)
  (func $_RNvNtNtCs8lg16XUPpM_4core9panicking11panic_const24panic_const_add_overflow (type 0) (param i32)
    i32.const 1048664
    i32.const 57
    local.get 0
    call $_RNvNtCs8lg16XUPpM_4core9panicking9panic_fmt
    unreachable)
  (table (;0;) 1 1 funcref)
  (memory (;0;) 17)
  (global $__stack_pointer (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "args_sizes_get" (func $args_sizes_get))
  (export "args_get" (func $args_get))
  (export "main" (func $main))
  (data $.rodata (i32.const 1048576) "driver/src/lib.rs\00\00\00\00\00\10\00\11\00\00\00\0f\00\00\00\05\00\00\00library/src/lib.rs\00\00$\00\10\00\12\00\00\00\0a\00\00\00\05\00\00\00$\00\10\00\12\00\00\00\05\00\00\00\05\00\00\00attempt to add with overflow"))
