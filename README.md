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

**Example**: ```./webradioparser.sh 2016-04-27 2016-04-28 STATS```
```
Showing statistics for timeframe 2016-04-27 till 2016-04-28, which is 2 days in total
The 10 most played songs during those 2 days were:
   8 Charlie Puth,One call away
   7 Justin Bieber,Love yourself
   6 Milow,Howling at the moon
   6 Ed Sheeran,Photograph
   6 DNCE,Cake by the ocean
   6 Coldplay,Hymn for the weekend
   5 X Ambassadors,Renegades
   5 Walk The Moon,Shut up and dance
   5 Robin Schulz & J.U.D.G.E.,Show me love
   5 Max Giesinger,80 Millionen
```

