import persim
import ripser
import MDAnalysis as mda
import argparse
from typing import *
import functools
import itertools
import time
start_time = time.time()
A = mda.Universe('/Scr/arango/ergosterol-amb/1-WorkflowDevelopment/4-tests/1-spongemaker/ERG.AMB.fig2/min/1.psf', '/Scr/arango/ergosterol-amb/1-WorkflowDevelopment/4-tests/1-spongemaker/ERG.AMB.fig2/min/1.pdb', in_memory=True)
B = mda.Universe('/Scr/arango/ergosterol-amb/weighted_ensemble/3-DGX-MAB-AmB-Distance/namd_config/nacl.psf', '/Scr/arango/ergosterol-amb/weighted_ensemble/3-DGX-MAB-AmB-Distance/namd_config/nacl.pdb', in_memory=True)

Asel = A.select_atoms('(resname ERG or resname AMB) and name C*')
Ahom = ripser.ripser(Asel.atoms.positions, maxdim=1)['dgms']
Bsel = B.select_atoms('(resname ERG or resname AMB) and name C*')
Bhom = ripser.ripser(Bsel.atoms.positions, maxdim=1)['dgms']

Wasser = persim.wasserstein(Ahom[1], Bhom[1])
print("{:.03f}".format(Wasser))
print("--- %s seconds ---" % (time.time() - start_time))
