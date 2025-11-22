
source ${SCRIPTS_DIR}/icc/powerplan.tcl
save_block -as ${DESIGN}_3_adolfo_post_power

##########################################################################################
## POSICIONAMIENTO
###########################################################################################
source ${SCRIPTS_DIR}/icc/placement.tcl
save_block -as ${DESIGN}_4_adolfo_post_place

###########################################################################################
## SÍNTESIS DE ÁRBOL DE RELOJ
###########################################################################################
source ${SCRIPTS_DIR}/icc/cts.tcl
save_block -as ${DESIGN}_5_adolfo_post_cts

###########################################################################################
## ENRUTAMIENTO
###########################################################################################
source ${SCRIPTS_DIR}/icc/routing.tcl
save_block -as ${DESIGN}_6_adolfo_post_route

#
