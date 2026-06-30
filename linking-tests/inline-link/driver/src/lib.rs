#![no_std]

use library::{args_get, args_sizes_get};

#[panic_handler]
fn panic(_info: &core::panic::PanicInfo) -> ! {
    loop {}
}

#[unsafe(no_mangle)]
pub extern "C" fn main() -> i32 {
    let args_sizes_get_result = args_sizes_get(1, 3);
    let args_get_result = args_get(2, 4); 

    args_sizes_get_result + args_get_result
}