#!/usr/bin/env bash
set -euo pipefail
if [ ! -d library/wit/deps ]; then
  (cd library && wkg wit fetch)
fi

cargo build -p library --release --target wasm32-unknown-unknown
wasm-tools component new target/wasm32-unknown-unknown/release/library.wasm -o library.wasm
wasm-tools print library.wasm -o library.wat
wac plug tex2.wasm --plug library.wasm -o merged_tex2.wasm
wasm-tools print merged_tex2.wasm -o merged_tex2.wat
wasmtime run merged_tex2.wasm > hello.dvi
echo "recovered hello.dvi with $(wc -c < hello.dvi) bytes"
dvipdf "hello.dvi"