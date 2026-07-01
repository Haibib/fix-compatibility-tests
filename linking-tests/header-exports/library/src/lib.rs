#![no_std]

#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}

const ERRNO_SUCCESS: i32 = 0;

#[unsafe(no_mangle)]
pub extern "C" fn args_get(argv: i32, argv_buf: i32) -> i32 {
    let _ = (argv, argv_buf);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn args_sizes_get(retptr0: i32, retptr1: i32) -> i32 {
    let _ = (retptr0, retptr1);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn environ_get(environ: i32, environ_buf: i32) -> i32 {
    let _ = (environ, environ_buf);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn environ_sizes_get(retptr0: i32, retptr1: i32) -> i32 {
    let _ = (retptr0, retptr1);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn clock_time_get(id: i32, precision: i64, time: i32) -> i32 {
    let _ = (id, precision, time);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_close(fd: i32) -> i32 {
    let _ = fd;
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_fdstat_get(fd: i32, stat: i32) -> i32 {
    let _ = (fd, stat);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_fdstat_set_flags(fd: i32, flags: i32) -> i32 {
    let _ = (fd, flags);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_prestat_get(fd: i32, prestat: i32) -> i32 {
    let _ = (fd, prestat);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_prestat_dir_name(fd: i32, path: i32, path_len: i32) -> i32 {
    let _ = (fd, path, path_len);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_read(fd: i32, iovs: i32, iovs_len: i32, nread: i32) -> i32 {
    let _ = (fd, iovs, iovs_len, nread);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_readdir(fd: i32, buf: i32, buf_len: i32, cookie: i64, bufused: i32) -> i32 {
    let _ = (fd, buf, buf_len, cookie, bufused);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_seek(fd: i32, offset: i64, whence: i32, newoffset: i32) -> i32 {
    let _ = (fd, offset, whence, newoffset);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn fd_write(fd: i32, iovs: i32, iovs_len: i32, nwritten: i32) -> i32 {
    let _ = (fd, iovs, iovs_len, nwritten);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn path_filestat_get(
    fd: i32,
    flags: i32,
    path: i32,
    path_len: i32,
    buf: i32,
) -> i32 {
    let _ = (fd, flags, path, path_len, buf);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn path_open(
    fd: i32,
    dirflags: i32,
    path: i32,
    path_len: i32,
    oflags: i32,
    fs_rights_base: i64,
    fs_rights_inheriting: i64,
    fdflags: i32,
    opened_fd: i32,
) -> i32 {
    let _ = (
        fd,
        dirflags,
        path,
        path_len,
        oflags,
        fs_rights_base,
        fs_rights_inheriting,
        fdflags,
        opened_fd,
    );
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn path_readlink(
    fd: i32,
    path: i32,
    path_len: i32,
    buf: i32,
    buf_len: i32,
    bufused: i32,
) -> i32 {
    let _ = (fd, path, path_len, buf, buf_len, bufused);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn path_rename(
    fd: i32,
    old_path: i32,
    old_path_len: i32,
    new_fd: i32,
    new_path: i32,
    new_path_len: i32,
) -> i32 {
    let _ = (fd, old_path, old_path_len, new_fd, new_path, new_path_len);
    ERRNO_SUCCESS
}

#[unsafe(no_mangle)]
pub extern "C" fn proc_exit(rval: i32) {
    let _ = rval;
}
