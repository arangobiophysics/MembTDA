#!/bin/bash

####################
# Sep 15 2022      #
# Andres S. Arango # 
####################
for NUMBER in {280..330}
do 
  cd ./DPPC_$NUMBER/namd/
  /Projects/arango/run_scripts/runl_gpu_namd3 a1.00.namd 
  cd ../../
done


