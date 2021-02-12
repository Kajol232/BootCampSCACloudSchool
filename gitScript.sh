#!/bin/sh

git init

git status

git add .

echo "input commit message"
read message

git commit -m "$message"

echo "input branch to push to"
read branch

git branch -M $branch

echo "input alias "
read alias

echo "input repo url"
read url

git remote add $alias $url

git push -u $alias $branch

git status

