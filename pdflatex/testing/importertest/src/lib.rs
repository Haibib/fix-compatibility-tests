#![no_std]
use wasm_bindgen::prelude::*;

#[wasm_bindgen]
pub mod wasi_imports {
    // Raw WASI Preview 1 imports.
    #[link(wasm_import_module = "wasi_snapshot_preview1")]
    unsafe extern "C" {
        pub fn args_get(argv: *mut *mut u8, argv_buf: *mut u8) -> i32;
        pub fn args_sizes_get(argc: *mut u32, argv_buf_size: *mut u32) -> i32;
    }
}

pub use wasi_imports::{args_get, args_sizes_get};