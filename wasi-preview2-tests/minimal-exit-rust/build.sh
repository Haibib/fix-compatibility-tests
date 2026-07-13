rustc --edition 2024 --crate-type cdylib --target wasm32-unknown-unknown \
      -C opt-level=z -C panic=abort -C lto -C codegen-units=1 \
      main.rs -o out/exit-module.wasm

wasm-tools component embed wit --world minimal out/exit-module.wasm -o out/embedded.wasm
wasm-tools component new out/embedded.wasm -o out/exit.component.wasm
