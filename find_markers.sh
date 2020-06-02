#!/bin/bash

get_markers="$HOME/Desktop/git/lib-teeworlds/demo.sh --markers "
demo_dir="${1:-./auto-zilly}"
demo_dir="${demo_dir%/}"

for demo in "$demo_dir"/*.demo
do
    demo_esc=$(printf "%q" "$demo")
    cmd="$get_markers $demo_esc"
    markers="$(eval "$cmd")" || \
        {
            echo "Error failed on:"
            echo "$cmd"
            exit 1
        }
    if [ "$markers" -gt "0" ]
    then
        echo "$demo"
        echo "$demo" >> markers.txt
    fi
done

