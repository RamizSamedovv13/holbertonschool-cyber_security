#!/bin/bash

# root check
if [[ $EUID -ne 0 ]]; then
  echo "Error: run with sudo"
  exit 1
fi

# iptables check
if ! command -v iptables &> /dev/null; then
  echo "Error: iptables not found on this system"
  exit 1
fi

# show rules
echo "=== IPTABLES RULES ==="
iptables -L -n -v --line-numbers
