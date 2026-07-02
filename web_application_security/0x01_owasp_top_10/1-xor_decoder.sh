#!/bin/bash

hash="$1"

# {xor} prefixini silirik
encoded="${hash#\{xor\}}"

# Base64 decode edirik, sonra hər byte-ı 0x5f ilə XOR edirik
echo "$encoded" | base64 -d | xxd -p -c 256 | while read -r hex; do
    for ((i=0; i<${#hex}; i+=2)); do
        byte=$((16#${hex:i:2}))
        printf "\\$(printf '%03o' $((byte ^ 0x5f)))"
    done
done

echo
