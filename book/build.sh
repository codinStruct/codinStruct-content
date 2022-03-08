#!/bin/bash

langs=(c javascript python)

build() (
    lang="$1"

    try() (
        output=$(eval "$1" 2>&1 1>/dev/null)
        ret=$?
        if [ $ret -ne 0 ]; then
            echo -e "\033[31mFailure building \033[34m$lang\033[39m:\n\033[31m$output\033[39m" >&2
        fi
        return $ret
    )

    try "cp \"SUMMARY-$lang.md\" \"../Content/$1/SUMMARY.md\"" && try "cp \"book-$lang.toml\" book.toml" || return

    try "mdbook build" && echo -e "Built \033[34m$lang\033[39m"
)

old_dir=$(pwd)
cd $(dirname $0)
if [ "$1" == "clean" ]; then
    rm -rf "./build"
else
    for lang in "${langs[@]}"; do
        build "$lang"
        rm -f "../Content/$lang/SUMMARY.md" "book.toml"
    done
    cp {index.css,index.html} build/ 2>/dev/null
fi
cd $old_dir
