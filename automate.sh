#!/usr/bin/env bash
function refresh_md() {
    echo "Use emacs to refresh README.md"
    for f in $(ls -1t */*/README.org); do
        echo "Update $f"
        dirname=$(dirname $f)
        cd $dirname
        /Applications/Emacs.app/Contents/MacOS/Emacs-x86_64-10_9 --batch -l ../../update_md.el
        cd ../../
    done
}

cd .

action=${1?}
case "$action" in 
    refresh_md)
        refresh_md
        ;;
        *) 
        echo "no matched action. Supported: refresh_md"
        ;;
esac
