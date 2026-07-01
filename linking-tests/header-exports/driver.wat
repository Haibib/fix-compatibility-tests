(module
  (type (;0;) (func (param i32 i32) (result i32)))
  (type (;1;) (func (param i32 i64 i32) (result i32)))
  (type (;2;) (func (param i32) (result i32)))
  (type (;3;) (func (param i32 i32 i32) (result i32)))
  (type (;4;) (func (param i32 i32 i32 i32) (result i32)))
  (type (;5;) (func (param i32 i32 i32 i64 i32) (result i32)))
  (type (;6;) (func (param i32 i64 i32 i32) (result i32)))
  (type (;7;) (func (param i32 i32 i32 i32 i32) (result i32)))
  (type (;8;) (func (param i32 i32 i32 i32 i32 i64 i64 i32 i32) (result i32)))
  (type (;9;) (func (param i32 i32 i32 i32 i32 i32) (result i32)))
  (type (;10;) (func (param i32)))
  (type (;11;) (func (result i32)))
  (import "wasi_snapshot_preview1" "args_get" (func (;0;) (type 0)))
  (import "wasi_snapshot_preview1" "args_sizes_get" (func (;1;) (type 0)))
  (import "wasi_snapshot_preview1" "environ_get" (func (;2;) (type 0)))
  (import "wasi_snapshot_preview1" "environ_sizes_get" (func (;3;) (type 0)))
  (import "wasi_snapshot_preview1" "clock_time_get" (func (;4;) (type 1)))
  (import "wasi_snapshot_preview1" "fd_close" (func (;5;) (type 2)))
  (import "wasi_snapshot_preview1" "fd_fdstat_get" (func (;6;) (type 0)))
  (import "wasi_snapshot_preview1" "fd_fdstat_set_flags" (func (;7;) (type 0)))
  (import "wasi_snapshot_preview1" "fd_prestat_get" (func (;8;) (type 0)))
  (import "wasi_snapshot_preview1" "fd_prestat_dir_name" (func (;9;) (type 3)))
  (import "wasi_snapshot_preview1" "fd_read" (func (;10;) (type 4)))
  (import "wasi_snapshot_preview1" "fd_readdir" (func (;11;) (type 5)))
  (import "wasi_snapshot_preview1" "fd_seek" (func (;12;) (type 6)))
  (import "wasi_snapshot_preview1" "fd_write" (func (;13;) (type 4)))
  (import "wasi_snapshot_preview1" "path_filestat_get" (func (;14;) (type 7)))
  (import "wasi_snapshot_preview1" "path_open" (func (;15;) (type 8)))
  (import "wasi_snapshot_preview1" "path_readlink" (func (;16;) (type 9)))
  (import "wasi_snapshot_preview1" "path_rename" (func (;17;) (type 9)))
  (import "wasi_snapshot_preview1" "proc_exit" (func (;18;) (type 10)))
  (func (;19;) (type 11) (result i32)
    (local i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32 i32)
    i32.const 0
    i32.const 0
    call 0
    local.set 0
    i32.const 0
    i32.const 0
    call 1
    local.set 1
    i32.const 0
    i32.const 0
    call 2
    local.set 2
    i32.const 0
    i32.const 0
    call 3
    local.set 3
    i32.const 0
    i64.const 0
    i32.const 0
    call 4
    local.set 4
    i32.const 0
    call 5
    local.set 5
    i32.const 0
    i32.const 0
    call 6
    local.set 6
    i32.const 0
    i32.const 0
    call 7
    local.set 7
    i32.const 0
    i32.const 0
    call 8
    local.set 8
    i32.const 0
    i32.const 0
    i32.const 0
    call 9
    local.set 9
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call 10
    local.set 10
    i32.const 0
    i32.const 0
    i32.const 0
    i64.const 0
    i32.const 0
    call 11
    local.set 11
    i32.const 0
    i64.const 0
    i32.const 0
    i32.const 0
    call 12
    local.set 12
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call 13
    local.set 13
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call 14
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
    call 15
    local.set 15
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call 16
    local.set 16
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    i32.const 0
    call 17
    local.set 17
    i32.const 0
    call 18
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
  (func (;20;) (type 0) (param i32 i32) (result i32)
    call 19)
  (memory (;0;) 16)
  (global (;0;) (mut i32) (i32.const 1048576))
  (export "memory" (memory 0))
  (export "main" (func 20)))
