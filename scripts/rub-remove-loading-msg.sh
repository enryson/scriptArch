#!/bin/bash
GRUB_CFG="/boot/grub/grub.cfg"

# Faz backup antes
cp "$GRUB_CFG" "${GRUB_CFG}.backup.$(date +%Y%m%d%H%M%S)"

# Remove linhas com 'echo' contendo Loading Linux e Loading initial ramdisk
sed -i "/echo.*Loading Linux/d" "$GRUB_CFG"
sed -i "/echo.*Loading initial ramdisk/d" "$GRUB_CFG"
