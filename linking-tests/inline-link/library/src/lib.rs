#![no_std]

#[unsafe(no_mangle)]
pub fn args_sizes_get(num_argument_ptr: i32, size_argument_ptr: i32) -> i32 {
    num_argument_ptr + size_argument_ptr
}

#[unsafe(no_mangle)]
pub fn args_get(argv_ptr: i32, argv_buf_ptr: i32) -> i32 {
    argv_ptr + argv_buf_ptr
}
