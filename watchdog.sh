#!/bin/bash

remote_user="xu.zu"
remote_host="login.discovery.neu.edu"
remote_script_path="/courses/CS7980.202510/students/xu.zu/valle-automation-script/check_and_submit.sh"
sleep_sec=3600

while true; do
	# SSH into the remote server and execute the check and submit script
	ssh -T ${remote_user}@${remote_host} "bash ${remote_script_path}"
	# Sleep for a specified amount of time before checking again
	sleep ${sleep_sec}
done
