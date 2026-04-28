#!/bin/bash
echo "$1: $(echo "$2" | grep -q "$(sha256sum "$1" | awk '{print $1}')" && echo OK || echo FAIL)"
