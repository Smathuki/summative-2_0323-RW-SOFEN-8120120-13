#!/bin/bash

# Define server details
HOST="a0dfc11ba139.a982e858.alu-cod.online"
USERNAME="a0dfc11ba139"
PASSWORD="899c79fc532cd0591af1"
DIRECTORY="/home/sftp-student/03033/summative"

# Define local directory name
LOCAL_DIR="0323-RW-SOFEN-8120120-13_q1"

# Create a tar file of the directory
tar -czf ${LOCAL_DIR}.tar.gz $LOCAL_DIR

# Use sshpass to handle password prompt
sshpass -p $PASSWORD scp ${LOCAL_DIR}.tar.gz ${USERNAME}@${HOST}:${DIRECTORY}

