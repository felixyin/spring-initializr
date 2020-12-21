#!/bin/sh

mkdir -p ~/tools/
mkdir -p ~/bin/

cp -r ../spring-initializr ~/tools/

ln -s ~/tools/spring-initializr/start.sh ~/bin/si

echo "提示: echo export PATH=$PATH:~/bin"
echo "使用： si"