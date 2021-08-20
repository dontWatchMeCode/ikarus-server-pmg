#!/usr/bin/sh
# with test options
# (unfinished)

OUTPUT=$(curl -K ./curl.conf 'http://192.168.56.3/virusscan' -F up_file=@../test_files/Ntr7x12i)

# --- TEST START ---
# arguments for testing
[ "$1" = "-v" ] && OUTPUT=$(curl -K ./curl.conf 'http://192.168.56.3/virusscan' -F up_file=@../test_files/eF9f8G3f)

[ "$1" = "-n" ] && OUTPUT=$(curl -K ./curl.conf 'http://10.0.0.0/virusscan' -F up_file=@../test_files/Ntr7x12i)

if [ "$1" = "-h" ]
    then
    echo "-v virustest"
    echo "-n nettest"
fi
# --- TEST STOP ---

STATUS=$(echo $OUTPUT | grep -o -P '(?<=<status>).*(?=</status>)')
NAME=$(echo $OUTPUT | grep -o -P '(?<=<name>).*(?=</name>)')

#echo $STATUS
# >> clean / infected

[ -z "$OUTPUT" ] && echo "OK" #&& command when server offline
# if OUTPUT null
# >> OK + command(?)

[ -n "$NAME" ] && echo "VIRUS:" $NAME
# if NAME !null
# >> VIRUS: + name from XML

[ -n "$OUTPUT" ] && [ -z "$NAME" ] && echo "OK"
# if OUTPUT !null & NAME null
# >> OK