#!/bin/bash
file="/library/tmp/pids/server.pid"
if [ -f "$file" ]
then
	# server.pid file found
  shutup && bundle exec rails s -b 0.0.0.0
else
	# server.pid file not found
  bundle exec rails s -b 0.0.0.0
fi
