#!/bin/bash

#HRRR
numthreads=3

datestring=`date -u -d "1 hour ago" +%Y%m%d`
hourstring=`date -u -d "1 hour ago" +%H`

#wrfsubhf01.grib2
outdir=/data2/weather/HRRR/${datestring}
mkdir -p ${outdir}
baseurl="http://nomads.ncep.noaa.gov/pub/data/nccf/com/hrrr/prod/hrrr."${datestring}
#for HH in `seq -w 0 1 15` ; do
for HH in `seq -w 00 1 6` ; do
  #for output_type in "wrfnat" "wrfsubh" "wrfprs" "wrfsfc" ; do #get all HRRR types, very big
  #for output_type in "wrfsubh" "wrfsfc" ; do
  #for output_type in "wrfnat" "wrfsubh" "wrfprs" "wrfsfc" ; do
  for output_type in "wrfsubh"  ; do
    srcurl=${baseurl}/hrrr.t${hourstring}z.${output_type}f${HH}.grib2
    echo ${srcurl}
    wget -qN -P ${outdir} ${srcurl} &
    (( counter += 1 ))
    if [[ counter%${numthreads} -eq 0 ]] ; then
     echo "Wait "${counter}
     wait
    fi
  done
done
