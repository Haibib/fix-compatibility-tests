cargo build --release --target wasm32-unknown-unknown
wasm2wat ./target/wasm32-unknown-unknown/release/library.wasm -o library.wat
wasm2wat ./target/wasm32-unknown-unknown/release/driver.wasm -o driver.wat
wasm-merge ./target/wasm32-unknown-unknown/release/driver.wasm driver ./target/wasm32-unknown-unknown/release/library.wasm wasi_snapshot_preview1 -o merged.wasm --enable-multimemory --rename-export-conflicts
wasm2wat --enable-multi-memory ./merged.wasm -o merged.wat
wasmtime run --invoke main merged.wasm 0 0