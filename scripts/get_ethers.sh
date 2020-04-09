#!/bin/sh
cat /etc/ethers | awk '{print $2,$1}' |sort
