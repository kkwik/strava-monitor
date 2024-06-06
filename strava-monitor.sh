#! /bin/bash
curl --silent -X GET "$1" > tmp

# Isolate table
grep -Poz '(?s)<table.*>.*<\/table>' tmp > table

#Compare to last run
cmp table old-table > differ

if [ -s "differ" ]; then
	notify-send -t 3000 "Strava Leaderboard has changed"
else
	notify-send -t 3000 "Strava Leaderboard has not changed"
fi

# Cleanup
rm tmp
mv table old-table
rm differ
