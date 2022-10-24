#!/bin/bash

################
# 20220918
# Andres S. Arango
#

for NUMBER in {280..330}; do
#NEED
grep ^"ENERGY:" /Scr/arango/Sobolev-Hyun/2-MembTempredict/DPPC_$NUMBER/namd/a1.00.log | awk '{print $2, $13}' >TEMP_$NUMBER.dat
	
done
#done
#done
