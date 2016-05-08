# webradiostats  

Made for Mac OSX 10.11 (El Capitan) - may brake on other unix OS  

EN: This small bash program parses the playlist of HR3 web radio for a given timespan and
- shows them sorted by date, or
- calculates the top10 of all played songs  

DE: Dieses kleine Bash Programm ruft die Playlist des HR3 Webradios für einen gegebenen Zeitraum ab und 
- zeigt sie sortiert nach Datum an, oder
- errechnet die Top10 der gespielten Lieder

## Usage
```
./webradioparser.sh STARTDATE ENDDATE LIST|STATS  
```

STARTDATE must be older than ENDDATE  

**Example**: $0 2016-04-01 2016-04-28 LIST

