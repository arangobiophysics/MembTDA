#!/bin/bash

#The goal of this script is to give the user an idea of how far their jobs are from completion


RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m'
for NUMBER in {280..330}; do
cd ./DPPC_$NUMBER/namd/
for filename in a1.*.log; do

	if grep -q "SIMULATION PARAMETERS" "$filename"; then
		
		#echo "YO YO"
		#Number of CPUs
		CPUN="$(awk '/Bench/ { sum += $4; n++ } END { if (n > 0) print sum / n; }' $filename)"
		
		#Nanoseconds per days
		NDS="$(awk '/Bench/ { sum += $8; n++ } END { if (n > 0) print (sum / n)**1; }' $filename)"
		
		#First time step of the log file 
		if grep -q "FIRST TIMESTEP" "$filename"; then

			FIRS=$(awk '/FIRST TIMESTEP/ { sum += $4; n++ } END { if (n > 0) print sum / n; }' $filename)""
		else
			FIRS=0
		fi

		#Number of total time steps NOS
		NOS1="$(awk '/TCL/ && /for/ {$1=$2=$3=$5=""; print $0}' $filename)"
		set -- $NOS1
		NOS="$(echo $1)"

		#FIRS plus NOS for total time steps
		TTS="$(echo $NOS + $FIRS | bc -l)"
		#TTS=$(($NOS + $FIRS))
		
		#Current time step progress
		CTS="$(tail -30 $filename | awk '/PRESSURE/ { sum += $2; n++ } END { if (n > 0) print sprintf("%.0f", sum / n); }')"
	
		MAT1="$(echo "($CTS / $TTS) * 100" | bc -l)"
		MAT2="$(echo "scale=2; $MAT1 / 1" | bc -l)"
	
		if grep -Fxq "CLOSING EXTENDED SYSTEM TRAJECTORY FILE" $filename
	
		then 
			MAT2=100
			CTS=$TTS
		fi
	

		CTSNS="$(echo "scale=2; $CTS / 500000" | bc -l)"
		TTSNS="$(echo "scale=2; $TTS / 500000" | bc -l)"

		echo "T$NUMBER"
		echo "$filename"
		echo -e "At $CPUN CPUs it's getting an average of ${BLUE}$NDS${NC} ns/day"
		
		if grep -Fxq "CLOSING EXTENDED SYSTEM TRAJECTORY FILE" $filename
		then
			echo -e "This job is ${GREEN}$MAT2%${NC} done ($CTS ts / $TTS ts)"
			echo -e "${GREEN}$CTSNS${NC} ns out of $TTSNS ns"
		else
			echo -e "This job is ${RED}$MAT2%${NC} done ($CTS ts / $TTS ts)"
			echo -e "${RED}$CTSNS${NC} ns out of $TTSNS ns"
		fi

		
		#echo "MAT2 is $MAT2"
		#echo "CTS is $CTS"
		#echo "TTS is $TTS"
		#echo "NOS is $NOS"
		#echo "FIRS is $FIRS"
		echo ""
	
		set -u CPUN
		set -u NDS
		set -u CTS
		set -u MAT1
		set -u MAT2
		set -u NOS
		set -u FIRS
	fi	

done
cd ../../
done

