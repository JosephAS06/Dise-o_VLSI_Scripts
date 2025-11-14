####################################################################################
# ATRIBUTOS DE LAS CAPAS DE METAL Y TRACKS DE POWER
####################################################################################

set_attribute [get_layers M1] routing_direction vertical
set_attribute [get_layers M2] routing_direction horizontal
set_attribute [get_layers M3] routing_direction vertical
set_attribute [get_layers M4] routing_direction horizontal
set_attribute [get_layers M5] routing_direction vertical
set_attribute [get_layers M6] routing_direction horizontal
set_attribute [get_layers M7] routing_direction vertical
set_attribute [get_layers M8] routing_direction horizontal
set_attribute [get_layers M9] routing_direction vertical
set_attribute [get_layers MRDL] routing_direction horizontal

create_track_pattern -layer M1 -site unit -type uniform \
            -direction vertical -offsets { 0.037 } -spacing 0.074 \
            -mask_pattern { mask_one mask_two }

##########################################################################################
# FLOORPLAN
##########################################################################################
# USE ESTE ARCHIVO PARA CUALQUIER COMANDO RELACIONADO A FLOORPLAN
# AQUI HAY ALGUNOS EJEMPLOS DE COSAS QUE PODRÍAN FUNCIONARLE


# INICIALIZACIÓN DE LA FORMA
initialize_floorplan \
  -flip_first_row true \
  -boundary {{0 0} {450 520}} \
  -core_offset {15 15 15 15}


##########################################################################################
# POSICIONAMIENTO DE SRAMS
##########################################################################################
set obj [get_cells -hierarchical *myram*]
move_objects [index_collection $obj end] -x 1 -y 352
move_objects [index_collection $obj end-1] -x 43 -y 352
move_objects [index_collection $obj end-2] -x 85 -y 352
move_objects [index_collection $obj end-3] -x 127 -y 352
move_objects [index_collection $obj end-4] -x 169 -y 352
move_objects [index_collection $obj end-5] -x 407 -y 352
move_objects [index_collection $obj end-6] -x 365 -y 352
move_objects [index_collection $obj end-7] -x 323 -y 352
move_objects [index_collection $obj end-8] -x 281 -y 352
move_objects [index_collection $obj end-9] -x 239 -y 352
move_objects [index_collection $obj end-10] -x 365 -y 170
move_objects [index_collection $obj end-11] -x 407 -y 170
move_objects [index_collection $obj end-12] -x 85 -y 170
move_objects [index_collection $obj end-13] -x 43 -y 170
move_objects [index_collection $obj end-14] -x 1 -y 170
move_objects [index_collection $obj end-15] -x 239 -y 1
move_objects [index_collection $obj end-16] -x 281 -y 1
move_objects [index_collection $obj end-17] -x 323 -y 1
move_objects [index_collection $obj end-18] -x 365 -y 1
move_objects [index_collection $obj end-19] -x 407 -y 1
move_objects [index_collection $obj end-20] -x 169 -y 1
move_objects [index_collection $obj end-21] -x 127 -y 1
move_objects [index_collection $obj end-22] -x 85 -y 1
move_objects [index_collection $obj end-23] -x 43 -y 1
move_objects [index_collection $obj end-24] -x 1 -y 1

#Floorplan probado
#set obj [get_cells -hierarchical *myram*]
#move_objects [index_collection $obj end] -x 1 -y 352
#move_objects [index_collection $obj end-1] -x 43 -y 352
#move_objects [index_collection $obj end-2] -x 85 -y 352
#rotate_objects [index_collection $obj end-3] -orient W
#move_objects [index_collection $obj end-3] -x 137 -y 479
#move_objects [index_collection $obj end-4] -x 439 -y 352
#move_objects [index_collection $obj end-5] -x 397 -y 352
#move_objects [index_collection $obj end-6] -x 355 -y 352
#move_objects [index_collection $obj end-7] -x 313 -y 352
#move_objects [index_collection $obj end-8] -x 439 -y 170
#rotate_objects [index_collection $obj end-9] -orient W
#rotate_objects [index_collection $obj end-10] -orient W
#move_objects [index_collection $obj end-9] -x 137 -y 437
#move_objects [index_collection $obj end-10] -x 137 -y 395
#move_objects [index_collection $obj end-11] -x 85 -y 170
#move_objects [index_collection $obj end-12] -x 43 -y 170
#move_objects [index_collection $obj end-13] -x 1 -y 170
#move_objects [index_collection $obj end-14] -x 271 -y 1
#move_objects [index_collection $obj end-15] -x 313 -y 1
#move_objects [index_collection $obj end-16] -x 355 -y 1
#move_objects [index_collection $obj end-17] -x 397 -y 1
#move_objects [index_collection $obj end-18] -x 439 -y 1
#move_objects [index_collection $obj end-19] -x 211 -y 1
#move_objects [index_collection $obj end-20] -x 169 -y 1
#move_objects [index_collection $obj end-21] -x 127 -y 1
#move_objects [index_collection $obj end-22] -x 85 -y 1
#move_objects [index_collection $obj end-23] -x 43 -y 1
#move_objects [index_collection $obj end-24] -x 1 -y 1

##########################################################################################
# BLOQUEOS DE PLACEMENT
##########################################################################################
create_placement_blockage -type hard -boundary [get_cells -hierarchical *myram*]

set_fixed_objects [get_cells -hierarchical *myram*] 

##########################################################################################
# POSICIONAMIENTO DE PINES
##########################################################################################
place_pins -ports [get_ports *]

##########################################################################################
# INICIALIZACIÓN DE REDES DE VDD/VSS
##########################################################################################
create_net -power $NDM_POWER_NET
create_net -ground $NDM_GROUND_NET 

connect_pg_net -net $NDM_POWER_NET [get_pins -hierarchical "*/VDD"]
connect_pg_net -net $NDM_GROUND_NET [get_pins -hierarchical "*/VSS"]

##########################################################################################
# POSICIONAMIENTO INICIAL
##########################################################################################
create_placement -floorplan -timing_driven
legalize_placement
