#!/usr/bin/sh
# with test options
# (unfinished)

# --- USER CONFIG ---
LOG="true"                      # true for enabeling log
LOG_PATH="/home/me/temp"        # should be absolute path

IP="192.168.56.101:80"          # ip + port

FILE="../test_files/Ntr7x12i"   # should be absolute path

OUTPUT=$(curl -K ./curl.conf http://$IP/virusscan -F up_file=@$FILE)

# --- TEST START ---
# arguments for testing
[ "$1" = "-v" ] && OUTPUT=$(curl -K ./curl.conf 'http://'$IP'/virusscan' -F up_file=@../test_files/eF9f8G3f)

[ "$1" = "-n" ] && OUTPUT=$(curl -K ./curl.conf 'http://'10.0.0.0'/virusscan' -F up_file=@../test_files/Ntr7x12i)

if [ "$1" = "-h" ]
    then
    echo "-v virustest"
    echo "-n nettest"
fi

STATUS=$(echo $OUTPUT | grep -o -P '(?<=<status>).*(?=</status>)')
NAME=$(echo $OUTPUT | grep -o -P '(?<=<name>).*(?=</name>)')

#echo $STATUS
# >> clean / infected

# if OUTPUT null
# >> OK + command(?)
[ -z "$OUTPUT" ] && echo "OK" #&& command when server offline

# if NAME !null
# >> VIRUS: + name from XML
[ -n "$NAME" ] && echo "VIRUS: $NAME"

# if OUTPUT !null & NAME null
# >> OK
[ -n "$OUTPUT" ] && [ -z "$NAME" ] && echo "OK"

# --- LOG ---
# if LOG true
# date; filename; status >> LOG_PATH/ikarus-server_pmg.log
if [ "$LOG" = "true" ]
    then
    echo `date` >> $LOG_PATH/ikarus-server_pmg.log
    # check if OUTPUT null
    # >> info or network error
    if [ -n "$OUTPUT" ]
        then
        echo "FILE NAME" >> $LOG_PATH/ikarus-server_pmg.log
        echo "status: $STATUS" >> $LOG_PATH/ikarus-server_pmg.log
        [ -n "$NAME" ] && echo "name: $NAME" >> $LOG_PATH/ikarus-server_pmg.log
        else
        echo "FILE NAME" >> $LOG_PATH/ikarus-server_pmg.log
        echo "connection error to $IP" >> $LOG_PATH/ikarus-server_pmg.log
    fi
    # seperator for different entrys
    echo "---" >> $LOG_PATH/ikarus-server_pmg.log
fi