#!/bin/bash
end=$(($SECONDS+300))
response=000
unityIsStarted=0
while :
do
    if [ $SECONDS -gt $end ]; then
	echo "Unity has not been detected running"
	exit 1
    fi
    response=$(curl --connect-timeout 1 --max-time 2 --write-out %{http_code} --silent --output /dev/null http://mdprojbld04.cmlatitude.local:8080/api/user-permissions/)
    if [ $response -ne "200" ]; then
        sleep 10
	echo -ne '.'
    else
	unityIsStarted=1
	echo "Unity successfully started"
        break
    fi
done
echo
