#!/usr/bin/env bash
function my_test() {
   for f in $(find . -name README.org); do
        dirname=$(basename $(dirname $f))
        echo "Update for $f"
        # sed -ie "s/url-external://g" $f
        # rm -rf $dirname/README.orge
        #exit
   done
}

function refresh_wordpress() {
    echo "Use emacs to update README.ord"
    for d in "concept" "design-feature" "design-project" "resource"; do
        cd "$d"
        for f in $(ls -1t */README.org); do
            echo "Update $f"
            dirname=$(basename $(dirname $f))
            cd $dirname
            /Applications/Emacs.app/Contents/MacOS/Emacs-x86_64-10_10 --batch -l ../../emacs-update.el
            cd ..
        done
        cd ..
    done
}

cd .

action=${1?}
case "$action" in 
    refresh_wordpress)
        refresh_wordpress
        ;;
    my_test)
        my_test
        ;;
        *) 
        echo "no matched action. Supported: refresh_link|my_test"
        ;;
esac
