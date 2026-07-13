CC="../../wasi-sdk-33.0-x86_64-linux/bin/clang"
"$CC" --target=wasm32-wasip1 -Os -o out/hello-world.module.wasm hello-world.c
wasm-tools print out/hello-world.module.wasm -o out/hello-world.module.wat
"$CC" --target=wasm32-wasip2 -Os -o out/hello-world.component.wasm hello-world.c
wasm-tools print out/hello-world.component.wasm -o out/hello-world.component.wat
wasm-tools component wit out/hello-world.component.wasm -o out/hello-world.wit
wasmtime run out/hello-world.component.wasm