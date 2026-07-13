clang --target=wasm32 -nostdlib -Wl,--export=add -Wl,--no-entry library.c -o out/core_module.wasm
wasm-tools component embed library.wit out/core_module.wasm -o out/embedded_core.wasm
wasm-tools component new out/embedded_core.wasm -o out/component.wasm
wasmtime run --invoke "add(5)" out/component.wasm