clang --target=wasm32 -nostdlib -Wl,--export=run -Wl,--no-entry driver.c -o out/driver_core.wasm 
clang --target=wasm32 -nostdlib -Wl,--export=add -Wl,--no-entry library.c -o out/library_core.wasm
wasm-tools component embed driver.wit out/driver_core.wasm -o out/embedded_driver.wasm
wasm-tools component embed library.wit out/library_core.wasm -o out/embedded_library.wasm
wasm-tools component new out/embedded_driver.wasm -o out/driver_component.wasm
wasm-tools component new out/embedded_library.wasm -o out/library_component.wasm
wac plug out/driver_component.wasm --plug out/library_component.wasm -o out/app.wasm
wasmtime run --invoke "main()" out/app.wasm
