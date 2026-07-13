cargo build --target wasm32-unknown-unknown --release
wasm-tools component embed world.wit target/wasm32-unknown-unknown/release/add-rust.wasm -o embedded-rust.wasm
wasm-tools component new embedded-rust.wasm -o rust-component.wasm
wasm-tools strip rust-component.wasm -o stripped-component.wasm
wasmtime run --invoke "run(5)" stripped-component.wasm