#!/bin/bash

# Set caps to escape
setxkbmap -option caps:escape

# Turn on protonvpn through strongswan
sudo ipsec start
sudo ipsec up protonvpn
