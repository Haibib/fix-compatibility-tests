cargo rustc -p library --release --target wasm32-unknown-unknown -- -C link-arg=--import-memory
cargo build -p driver --release --target wasm32-unknown-unknown
wasm2wat ./target/wasm32-unknown-unknown/release/library.wasm -o library.wat
wasm2wat ./target/wasm32-unknown-unknown/release/driver.wasm -o driver.wat
wasm-merge ./target/wasm32-unknown-unknown/release/driver.wasm driver ./target/wasm32-unknown-unknown/release/library.wasm wasi_snapshot_preview1 -o merged.wasm --enable-multimemory
wasm2wat ./merged.wasm -o merged.wat
wasmtime run --invoke main merged.wasm 0 0