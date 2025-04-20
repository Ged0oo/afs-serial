#!/bin/bash

# Directory to watch
WATCH_DIR="/path/to/your/directory"

# Jenkins URL and Job Information
JENKINS_URL="http://<JENKINS_URL>"
JENKINS_JOB_NAME="<JENKINS_JOB_NAME>"
JENKINS_USER="<JENKINS_USER>"
JENKINS_API_TOKEN="<JENKINS_API_TOKEN>"

# Watch for changes in the directory and subdirectories
while inotifywait -r -e modify,create,delete $WATCH_DIR; do
    # Trigger Jenkins job using its REST API
    curl -X POST "$JENKINS_URL/job/$JENKINS_JOB_NAME/build" --user "$JENKINS_USER:$JENKINS_API_TOKEN"
    echo "Jenkins job triggered!"
done

