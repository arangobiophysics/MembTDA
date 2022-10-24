
#########
#VMD script to scrape water and hydrogen from membranes
#Andres S. Arango
#2022-10-06
#########

set NUM [lindex $argv 0]
mol new /Scr/arango/Sobolev-Hyun/2-MembTempredict/DPPC_$NUM/namd/step5_input.psf
mol addfile /Scr/arango/Sobolev-Hyun/2-MembTempredict/DPPC_$NUM/namd/test.dcd waitfor all

set sel [atomselect top "noh and not water and not ions"]

$sel writepsf /Scr/arango/Sobolev-Hyun/2-MembTempredict/DPPC_$NUM/namd/test2.psf
animate write dcd /Scr/arango/Sobolev-Hyun/2-MembTempredict/DPPC_$NUM/namd/test2.dcd beg 0 end 199 skip 1 waitfor -1 sel $sel top

set sel2 [atomselect top "noh and not water and not ions" frame 0]

$sel writepdb /Scr/arango/Sobolev-Hyun/2-MembTempredict/DPPC_$NUM/namd/test2.pdb

exit
