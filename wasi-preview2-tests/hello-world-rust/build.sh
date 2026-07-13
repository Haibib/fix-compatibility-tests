rustc --target wasm32-wasip1 -O hello-world.rs -o out/hello-world.module.wasm
wasm-tools print out/hello-world.module.wasm -o out/hello-world.module.wat
rustc --target wasm32-wasip2 -O hello-world.rs -o out/hello-world.component.wasm
wasm-tools print out/hello-world.component.wasm -o out/hello-world.component.wat
wasm-tools component wit out/hello-world.component.wasm -o out/hello-world.wit
wasmtime run out/hello-world.component.wasm