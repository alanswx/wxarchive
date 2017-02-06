# wxarchive

These are some updated scripts to download and archive HRRR and MRMS data that might be interesting. 

The go in cron like this:


    # m h  dom mon dow   command
    * * * * * /data2/weather/wxarchive/download_latest_mrms.sh &> /data2/wxarchive/mrms.log
    1 * * * * /data2/weather/wxarchive/get_hrrr.sh &> /data2/wxarchive/hrrr.log
    25 * * * * /data2/weather/wxarchive/get_hrrr.sh &> /data2/wxarchive/hrrr.log
