#![no_std]
#![no_main]
 
#[link(wasm_import_module = "wasi:cli/exit@0.2.0")]
unsafe extern "C" {
    #[link_name = "exit"]
    fn wasi_exit(status: i32);
}
 
#[unsafe(export_name = "wasi:cli/run@0.2.0#run")]
pub extern "C" fn run() -> i32 {
    unsafe { wasi_exit(0) };
    0
}
 
#[panic_handler]
fn panic(_: &core::panic::PanicInfo) -> ! {
    loop {}
}
 