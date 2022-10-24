#!/bin/bash

####################
# Sep 15 2022      #
# Andres S. Arango # 
####################
for NUMBER in {280..330}
do 
#Copy folder and change the temperature for each system :)
 # cp ./DPPC_280/namd/a1.00.namd ./DPPC_$NUMBER/namd/a1.00.namd
 # cp ./DPPC_280/namd/a1.01.namd ./DPPC_$NUMBER/namd/a1.01.namd
  sed -i -e "s/useConstantArea       yes/useConstantRatio       yes/g" ./DPPC_$NUMBER/namd/*namd
done


