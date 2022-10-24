#!/bin/bash

################
# 20220918
# Andres S. Arango
#

for NUMBER in {280..330}; do
		/Scr/hyunpark/anaconda3/envs/deeplearning/bin/python -m truncate_dcd --data_dir /Scr/arango/Sobolev-Hyun/2-MembTempredict/DPPC_$NUMBER/namd --psf step5_input.psf --trajs 1.00.dcd 
done
#done
#done
