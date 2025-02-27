#!/bin/bash

COURSE="devops from current script"
echo "Before calling other script, course: $COURSE"
echo "Process id of current shell script: $$"
./16-other-script.sh
echo "After calling other script , course: $COURSE"
