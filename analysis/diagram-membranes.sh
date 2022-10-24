#!/bin/bash

################
# 20220918
# Andres S. Arango
#

for NUMBER in {286..330}; do
#NEED
#for x {1..4}; do
#for y {1..4}; do
#python = /Projects/arango/anaconda3/envs/westpa2/bin/python 
#Quadrant 1, top right
		/Scr/hyunpark/anaconda3/envs/deeplearning/bin/python -m data_utils --data_dir /Scr/arango/Sobolev-Hyun/2-MembTempredict/DPPC_$NUMBER/namd --psf step5_input.psf --pdb step5_input.pdb --trajs test.dcd --atom_selection "not name H* and same residue as (resname DPPC and name C22 C23 C24 C25 C26 C27 C28 C29 C210 C211 C212 C213 C214 C215 C216 C32 C33 C34 C35 C36 C37 C38 C39 C310 C311 C312 C313 C314 C315 C316) and prop x < 0 and prop y > 0" --multiprocessing --filename $NUMBER.1.pickle
#Quadrant 2, top left
		/Scr/hyunpark/anaconda3/envs/deeplearning/bin/python -m data_utils --data_dir /Scr/arango/Sobolev-Hyun/2-MembTempredict/DPPC_$NUMBER/namd --psf step5_input.psf --pdb step5_input.pdb --trajs test.dcd --atom_selection "not name H* and same residue as (resname DPPC and name C22 C23 C24 C25 C26 C27 C28 C29 C210 C211 C212 C213 C214 C215 C216 C32 C33 C34 C35 C36 C37 C38 C39 C310 C311 C312 C313 C314 C315 C316) and prop x > 0 and prop y > 0" --multiprocessing --filename $NUMBER.2.pickle
#Quadrant 3, bottom right
		/Scr/hyunpark/anaconda3/envs/deeplearning/bin/python -m data_utils --data_dir /Scr/arango/Sobolev-Hyun/2-MembTempredict/DPPC_$NUMBER/namd --psf step5_input.psf --pdb step5_input.pdb --trajs test.dcd --atom_selection "not name H* and same residue as (resname DPPC and name C22 C23 C24 C25 C26 C27 C28 C29 C210 C211 C212 C213 C214 C215 C216 C32 C33 C34 C35 C36 C37 C38 C39 C310 C311 C312 C313 C314 C315 C316) and prop x < 0 and prop y < 0" --multiprocessing --filename $NUMBER.3.pickle
#Quadrant 4, bottom left
		/Scr/hyunpark/anaconda3/envs/deeplearning/bin/python -m data_utils --data_dir /Scr/arango/Sobolev-Hyun/2-MembTempredict/DPPC_$NUMBER/namd --psf step5_input.psf --pdb step5_input.pdb --trajs test.dcd --atom_selection "not name H* and same residue as (resname DPPC and name C22 C23 C24 C25 C26 C27 C28 C29 C210 C211 C212 C213 C214 C215 C216 C32 C33 C34 C35 C36 C37 C38 C39 C310 C311 C312 C313 C314 C315 C316) and prop x > 0 and prop y < 0" --multiprocessing --filename $NUMBER.4.pickle
done
#done
#done
