#!/bin/bash
# This bashscript was put together on Mac OS X 10.11 (El Capitan).
# Due to Apple(tm), the "date" command and others might need some customization on other unix platforms
# # # # # # # # # # # # # # #

HR3URL="http://playlist.hr-online.de/playlist/playlist.php"

TEMPFILE=/tmp/webradiostats.tmp
rm $TEMPFILE

##################################
# Checking the provided arguments and printing some help

EXPECTED_ARGS=3
E_BADARGS=65

if [ $# -ne $EXPECTED_ARGS ]
then
  printf "\nERROR: not enough arguments provided.\n"
  printf "\nUsage: $0 STARTDATE ENDDATE LIST|STATS\n"
  printf "STARTDATE must be older than ENDDATE\n\n"
  printf "Example: $0 2016-04-01 2016-04-28 LIST\n\n"
  exit $E_BADARGS
fi
##################################
# Assigning the provided arguments to variables

DATEFROM=$1
DATETO=$2
FUNCT=$3

TIMESPAN=`datediff $DATEFROM $DATETO`

##################################
# ----TODO----- Some sanity checks
# Check if DATEFROM is less than DATETO
# Check if FUNCT is LIST or STATS

##################################
function getsongs {  # retrieves the playlist for the given dates
i="0"
while [ "$i" -le $TIMESPAN ] ; do # do this for $i days prior to $DATETO
	DATETOGET=`date -j -v-$i\d -f "%Y-%m-%d" "$DATETO" "+%Y-%m-%d"`
	for HOUR in {00..23}; do	# cycle through the hours of the day, if we're parsing the current day hours that didn't yet happen are automagically ignored
		curl -s $HR3URL\?tpl\=hr3neu\&datum\=$DATETOGET\&uhr\=$HOUR | tail -n+30 | grep -B150 "</table>" | ./convertHTMLtable2CSV.py 2>&1 | grep -v "Traceback\|output\|convertHTMLtable2CSV.py\|Unicode\|Datum" | sort >> $TEMPFILE # curl the playlist hour by hour, day by day, convert the <table> to csv, ignore some errors and append the result to a temporary file
		done
	i=`expr $i + 1`  # update the offset counter (until the while loop is no longer true, thus we've finished our work)
done
}

##################################
function statistics {
	#Most played songs in timeframe
	printf "The 10 most played songs during those `expr $TIMESPAN + 1` days were:\n"
	cat $TEMPFILE | cut -c 18- | sort | uniq -c | sort -nr | head  # cat the tempfile and do some formatting, then output the top10
}

##################################
# MAIN

if [ "$FUNCT" == "LIST" ]; then
	getsongs
	printf "Showing the songs for timeframe $DATEFROM till $DATETO, which is `expr $TIMESPAN + 1` days in total\n"
	cat $TEMPFILE
fi

if [ "$FUNCT" == "STATS" ]; then
	getsongs
	printf "Showing statistics for timeframe $DATEFROM till $DATETO, which is `expr $TIMESPAN + 1` days in total\n"
	statistics
fi
###################################

exit 0

