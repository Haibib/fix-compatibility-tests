fn main() {
    for (i, arg) in std::env::args().enumerate() {
        println!("{i}: {arg}");
    }
}






/*use std::ffi::CStr;
use std::os::raw::c_char;

#[link(wasm_import_module = "wasi_snapshot_preview1")]
unsafe extern "C" {
    fn args_sizes_get(argc: *mut u32, argv_buf_size: *mut u32) -> i32;
    fn args_get(argv: *mut *mut c_char, argv_buf: *mut c_char) -> i32;
}

fn main() {
    unsafe {
        let mut argc: u32 = 0;
        let mut argv_buf_size: u32 = 0;

        let error = args_sizes_get(&mut argc, &mut argv_buf_size);
        if error != 0 {
            eprintln!("args_sizes_get failed with errno={}", error);
            return;
        }

        let mut argv_buf = vec![0u8; argv_buf_size as usize];
        let mut argv_pointers: Vec<*mut c_char> = vec![std::ptr::null_mut(); argc as usize];

        let error = args_get(
            argv_pointers.as_mut_ptr(),
            argv_buf.as_mut_ptr() as *mut c_char,
        );
        if error != 0 {
            eprintln!("args_get failed with errno={}", error);
            return;
        }

        for (i, pointer) in argv_pointers.iter().enumerate() {
            let arg = CStr::from_ptr(*pointer).to_string_lossy();
            println!("arg[{i}] = {arg}");
        }
    }
}*/
