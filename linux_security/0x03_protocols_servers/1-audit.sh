#!/bin/bash

CONFIG_FILE="/etc/ssh/sshd_config"

# root check
if [[ $EUID -ne 0 ]]; then
  echo "Run with sudo"
  exit 1
fi

if [[ ! -f "$CONFIG_FILE" ]]; then
  echo "SSH config not found"
  exit 1
fi

echo "=== SSH CONFIG AUDIT ==="

# show main config (clean, comments removed)
grep -E "^(Include|KbdInteractiveAuthentication|UsePAM|X11Forwarding|PrintMotd|AcceptEnv|Subsystem|PasswordAuthentication|PermitRootLogin|AuthorizedKeysFile|TCPKeepAlive)" "$CONFIG_FILE"
