#!/bin/bash

# Horrible way to get the difference in the keys between the two files
diff -U0 --label Dutch --label English \
    <(awk '/{KEYS}/,/{VALUE}/' tl_NL.txt | grep -v '{KEYS\|VALUE}' | sed -e 's/nl_//' | sort) \
    <(awk '/{KEYS}/,/{VALUE}/' tl_EN.txt | grep -v '{KEYS\|VALUE}'  | sort )
