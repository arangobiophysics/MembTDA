#!/bin/bash

####################
# Sep 15 2022      #
# Andres S. Arango # 
####################
for NUMBER in {280..330}
do 
#Copy folder and change the temperature for each system :)
  sed -i -e "s/500000/100000000/g" ./DPPC_$NUMBER/namd/*namd
done


