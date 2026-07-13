mod lib;
use lib::add;

#[unsafe(no_mangle)]
pub extern "C" fn run(x: u32) -> u32 {
    add(x)
}