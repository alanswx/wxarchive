#!/bin/bash

datestring=`date -u -d "1 minute ago" +%Y%m%d`

outdir=/data2/weather/MRMS/${datestring}
mkdir -p ${outdir}


URL=http://mrms.ncep.noaa.gov/data/2D/SeamlessHSR/
echo $URL
FILE=`curl $URL | grep "grib2.gz" |  tail -n 1 | cut -f 2 -d \"`
echo $URL$FILE
wget -N -c -P ${outdir} $URL$FILE


URL=http://mrms.ncep.noaa.gov/data/2D/PrecipFlag/
echo $URL
FILE2=`curl $URL | grep "grib2.gz" |  tail -n 1 | cut -f 2 -d \"`
echo $URL$FILE2
wget -N -c -P ${outdir} $URL$FILE2

#URL=http://mrms.ncep.noaa.gov/data/2D/NLDN_LightningDensity_030_min/
#echo $URL
#FILE=`curl $URL | grep "grib2.gz" |  tail -n 1 | cut -f 2 -d \"`
#echo $URL$FILE
#wget -N -c -P data  $URL$FILE
