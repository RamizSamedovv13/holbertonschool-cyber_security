#!/bin/bash
curl -s http://$1 > /dev/null && echo "OK"
