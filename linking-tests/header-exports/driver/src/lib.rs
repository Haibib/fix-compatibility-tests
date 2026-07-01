#![no_std]

#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}

#[link(wasm_import_module = "wasi_snapshot_preview1")]
unsafe extern "C" {
    fn args_get(argv: i32, argv_buf: i32) -> i32;
    fn args_sizes_get(argc: i32, argv_buf_size: i32) -> i32;
    fn environ_get(environ: i32, environ_buf: i32) -> i32;
    fn environ_sizes_get(environc: i32, environ_buf_size: i32) -> i32;
    fn clock_time_get(id: i32, precision: i64, time: i32) -> i32;
    fn fd_close(fd: i32) -> i32;
    fn fd_fdstat_get(fd: i32, stat: i32) -> i32;
    fn fd_fdstat_set_flags(fd: i32, flags: i32) -> i32;
    fn fd_prestat_get(fd: i32, prestat: i32) -> i32;
    fn fd_prestat_dir_name(fd: i32, path: i32, path_len: i32) -> i32;
    fn fd_read(fd: i32, iovs: i32, iovs_len: i32, nread: i32) -> i32;
    fn fd_readdir(fd: i32, buf: i32, buf_len: i32, cookie: i64, bufused: i32) -> i32;
    fn fd_seek(fd: i32, offset: i64, whence: i32, newoffset: i32) -> i32;
    fn fd_write(fd: i32, iovs: i32, iovs_len: i32, nwritten: i32) -> i32;
    fn path_filestat_get(fd: i32, flags: i32, path: i32, path_len: i32, buf: i32) -> i32;
    fn path_open(
        fd: i32,
        dirflags: i32,
        path: i32,
        path_len: i32,
        oflags: i32,
        fs_rights_base: i64,
        fs_rights_inheriting: i64,
        fdflags: i32,
        opened_fd: i32,
    ) -> i32;
    fn path_readlink(
        fd: i32,
        path: i32,
        path_len: i32,
        buf: i32,
        buf_len: i32,
        bufused: i32,
    ) -> i32;
    fn path_rename(
        fd: i32,
        old_path: i32,
        old_path_len: i32,
        new_fd: i32,
        new_path: i32,
        new_path_len: i32,
    ) -> i32;
    fn proc_exit(rval: i32);
}

#[unsafe(no_mangle)]
pub extern "C" fn main() -> i32 {
    let mut result: i32 = 0;
    unsafe {
        result = result.wrapping_add(args_get(0, 0));
        result = result.wrapping_add(args_sizes_get(0, 0));
        result = result.wrapping_add(environ_get(0, 0));
        result = result.wrapping_add(environ_sizes_get(0, 0));
        result = result.wrapping_add(clock_time_get(0, 0, 0));
        result = result.wrapping_add(fd_close(0));
        result = result.wrapping_add(fd_fdstat_get(0, 0));
        result = result.wrapping_add(fd_fdstat_set_flags(0, 0));
        result = result.wrapping_add(fd_prestat_get(0, 0));
        result = result.wrapping_add(fd_prestat_dir_name(0, 0, 0));
        result = result.wrapping_add(fd_read(0, 0, 0, 0));
        result = result.wrapping_add(fd_readdir(0, 0, 0, 0, 0));
        result = result.wrapping_add(fd_seek(0, 0, 0, 0));
        result = result.wrapping_add(fd_write(0, 0, 0, 0));
        result = result.wrapping_add(path_filestat_get(0, 0, 0, 0, 0));
        result = result.wrapping_add(path_open(0, 0, 0, 0, 0, 0, 0, 0, 0));
        result = result.wrapping_add(path_readlink(0, 0, 0, 0, 0, 0));
        result = result.wrapping_add(path_rename(0, 0, 0, 0, 0, 0));
        proc_exit(0);
    }
    result
}
