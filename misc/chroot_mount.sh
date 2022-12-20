#!/bin/bash 

mount --rbind /dev ./dev
mount --make-rslave ./dev
mount -t proc /proc ./proc
mount --rbind /sys ./sys
mount --make-rslave ./sys
mount --rbind /tmp ./tmp
mount --bind /run ./run
