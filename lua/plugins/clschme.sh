#!/bin/bash

if [ $# -ne 2 ]; then
  echo "usage: <curr> <new>"
  exit 1
fi

curr_cls=$1
new_cls=$2

mv $curr_cls colorschemes/
mv $new_cls .
