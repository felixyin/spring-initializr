#!/bin/sh

# nohup java -jar ./start-site-exec.jar  &
# tail -n 1000 -f nohup.out
#nohup java -jar ./start-site-exec.jar 2>/dev/null &

java -jar ~/tools/spring-initializr/start-site-exec.jar
