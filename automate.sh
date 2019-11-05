#!/bin/bash -e
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
    echo "Use emacs to update wordpress posts"
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

function git_push() {
    for d in $(ls -1); do
        if [ -d "$d" ] && [ -f "$d/.git" ] ; then
            cd "$d"
            echo "In ${d}, git commit and push"
            git commit -am "update doc"
            git push origin
            cd ..
        fi
    done
    git commit -am "update doc"
    git push origin
}

function git_pull() {
    for d in $(ls -1); do
        if [ -d "$d" ] && [ -f "$d/.git" ] ; then
            cd "$d"
            echo "In ${d}, git commit and push"
            git pull origin
            cd ..
        fi
    done
    git pull origin
}

function refresh_link() {
    echo "refresh link"
    for f in $(ls -1t */*/README.org); do
        category=$(dirname $(dirname $f))
        dirname=$(basename $(dirname $f))
        if ! grep "github.com\/dennyzhang\/architect.dennyzhang.com.*$dirname" $f 1>/dev/null 2>&1; then
            echo "Update github fork link for $f"
            sed -ie "s/github.com\/dennyzhang\/architect.dennyzhang.com.*\">/github.com\/dennyzhang\/architect.dennyzhang.com\/tree\/master\/$category\/$dirname\">/g" $f
            rm -rf $dirname/README.orge
        fi
    done
}

action=${1?}
eval "$action"
