#!/bin/bash

# Set your local directory to monitor
WATCH_DIR="/home/nagy/Desktop/grad/Embedded/jenkins"

# Jenkins URL and API token (you need to create an API token for your Jenkins user)
JENKINS_URL="http://localhost:8080/job/PushToGitHub/build"
JENKINS_USER="admin"
JENKINS_API_TOKEN="118dd9fb4f2f80234536fbd9fcad10442e"

# Monitor directory for changes
inotifywait -m -r -e modify,create,delete "$WATCH_DIR" |
while read path action file; do
    echo "Change detected: $action $file in $path"
    
    # Trigger Jenkins job
    curl -X POST "$JENKINS_URL" --user "$JENKINS_USER:$JENKINS_API_TOKEN"
done
