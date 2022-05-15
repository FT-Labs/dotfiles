#!/bin/bash

for dir in */; do
    cd "$dir"
	git pull
	cd ..
done
