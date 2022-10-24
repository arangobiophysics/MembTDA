#!/bin/bash

####################
# Sep 15 2022      #
# Andres S. Arango # 
####################
for NUMBER in {280..326}
do 
#Copy folder and change the temperature for each system :)
  cp -r DPPC_330 DPPC_$NUMBER
  sed -i -e "s/330/$NUMBER/g" ./DPPC_$NUMBER/namd/*namd
done


