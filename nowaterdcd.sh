#!/bin/bash

################
# 20220918
# Andres S. Arango
#

for NUMBER in {280..330}; do
	vmd -dispdev text -e ./scrape_water.tcl -args $NUMBER
done
#done
#done
