(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (result i32)))
  (type (;2;) (func (param i32 i64 i32) (result i32)))
  (type (;3;) (func (param i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;6;) (func (param i32 i32 i32 i64 i32) (result i32)))
  (type (;7;) (func (param i32 i64 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32 i64 i64 i32 i32) (result i32)))
  (type (;10;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;11;) (func (param i32)))
  (func (;0;) (type 1) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 0
    i32.const 0
    call 2
    local.set 0
    i32.const 0
    i32.const 0
    call 2
    local.set 1
    i32.const 0
    i32.const 0
    call 2
    local.set 2
    i32.const 0
    i32.const 0
    call 2
    local.set 3
    i32.const 0
    i64.const 0
    i32.const 0
    call 3
    local.set 4
    i32.const 0
    call 4
    local.set 5
    i32.const 0
    i32.const 0
    call 2
    local.set 6
    i32.const 0
    i32.const 0
    call 2
    local.set 7
    i32.const 0
    i32.const 0
    call 2
    local.set 8
    i32.const 0
    i32.const 0
    i32.const 0
    call 5
    local.set 9
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call 6
    local.set 10
    i32.const 0
    i32.const 0
    i32.const 0
    i64.const 0
    i32.const 0
    call 7
    local.set 11
    i32.const 0
    i64.const 0
    i32.const 0
    i32.const 0
    call 8
    local.set 12
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call 6
    local.set 13
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call 9
    local.set 14
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i64.const 0
    i64.const 0
    i32.const 0
    i32.const 0
    call 10
    local.set 15
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call 11
    local.set 16
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call 11
    local.set 17
    i32.const 0
    call 12
    local.get 17
    local.get 16
    local.get 15
    local.get 14
    local.get 13
    local.get 12
    local.get 11
    local.get 10
    local.get 9
    local.get 8
    local.get 7
    local.get 6
    local.get 5
    local.get 4
    local.get 3
    local.get 2
    local.get 1
    local.get 0
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add
    i32.add)
  (func (;1;) (type 0) (param i32 i32) (result i32)
    call 0)
  (func (;2;) (type 0) (param i32 i32) (result i32)
    i32.const 0)
  (func (;3;) (type 2) (param i32 i64 i32) (result i32)
    i32.const 0)
  (func (;4;) (type 3) (param i32) (result i32)
    i32.const 0)
  (func (;5;) (type 4) (param i32 i32 i32) (result i32)
    i32.const 0)
  (func (;6;) (type 5) (param i32 i32 i32 i32) (result i32)
    i32.const 0)
  (func (;7;) (type 6) (param i32 i32 i32 i64 i32) (result i32)
    i32.const 0)
  (func (;8;) (type 7) (param i32 i64 i32 i32) (result i32)
    i32.const 0)
  (func (;9;) (type 8) (param i32 i32 i32 i32 i32) (result i32)
    i32.const 0)
  (func (;10;) (type 9) (param i32 i32 i32 i32 i32 i64 i64 i32 i32) (result i32)
    i32.const 0)
  (func (;11;) (type 10) (param i32 i32 i32 i32 i32 i32) (result i32)
    i32.const 0)
  (func (;12;) (type 11) (param i32))
  (memory (;0;) 16)
  (memory (;1;) 16)
  (export "memory" (memory 0))
  (export "main" (func 1))
  (export "memory_2" (memory 1))
  (export "args_get" (func 2))
  (export "clock_time_get" (func 3))
  (export "fd_close" (func 4))
  (export "fd_prestat_dir_name" (func 5))
  (export "fd_read" (func 6))
  (export "fd_readdir" (func 7))
  (export "fd_seek" (func 8))
  (export "path_filestat_get" (func 9))
  (export "path_open" (func 10))
  (export "path_readlink" (func 11))
  (export "proc_exit" (func 12))
  (export "path_rename" (func 11))
  (export "args_sizes_get" (func 2))
  (export "environ_get" (func 2))
  (export "environ_sizes_get" (func 2))
  (export "fd_fdstat_get" (func 2))
  (export "fd_fdstat_set_flags" (func 2))
  (export "fd_prestat_get" (func 2))
  (export "fd_write" (func 6)))
