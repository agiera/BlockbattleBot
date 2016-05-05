#!/bin/sh

date;

#make pipes || exit
make -f makefile.bg makepipes || exit
kill `ps | grep java | cut -c 0-5`
kill `ps | grep pipeagent | cut -c 0-5`
kill `ps | grep pipemain | cut -c 0-5`

(java -classpath Backgammon/src RLGlueEnvironment.env_pipe_handler RLGlueEnvironment.RLGlueEnvironment rl-glue rl-glue | grep -v "no board" | grep "00.0") &
./pipemain $* &
./pipeagent $*
