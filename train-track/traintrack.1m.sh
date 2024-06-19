#!/bin/bash

# <xbar.title>TrainTrack</xbar.title>
# <xbar.version>v1.0.0</xbar.version>
# <xbar.author>Mike Wagstaff</xbar.author>
# <xbar.author.github>mwagstaff</xbar.author.github>
# <xbar.desc>Shows the status of your next trains for a given UK railway journey</xbar.desc>  

# Only compatible with direct journeys, not when you have to change stations
# When setting from and to stations, please use UK railway station CRS codes
# You can look CRS codes up here: https://www.rail-record.co.uk/railway-location-codes/
# The "max_departures" parameter is the number of trains you wish to show (note: there's only so many returned by the API in any case)
# Use the return_after time to a the time after which you wish to display the return journey, or leave blank to disable

# If you like this, you may also like the corresponding app, TrainTrack UK: https://apps.apple.com/gb/app/traintrack-uk/id6504205950 

export from_station_code='KTH'
export to_station_code='VIC'
export max_departures='5'
export return_after='12:00'

# Call the API to get the output
curl --silent "https://train-track-api.fly.dev/api/v1/xbar/from/${from_station_code}/to/${to_station_code}/max_departures/${max_departures}/return_after/${return_after}"