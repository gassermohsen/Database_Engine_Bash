#!/usr/bin/bash

read -p "Whats your name :" Name 
echo "$Name"
ls -la /home/$Name
# cp /home/$Name /temp
ps -u $Name