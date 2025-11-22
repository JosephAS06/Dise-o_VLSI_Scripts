##########################################################################################
# FLOORPLAN
##########################################################################################
# USE ESTE ARCHIVO PARA CUALQUIER COMANDO RELACIONADO A FLOORPLAN
# AQUI HAY ALGUNOS EJEMPLOS DE COSAS QUE PODRÍAN FUNCIONARLE


# INICIALIZACIÓN DE LA FORMA
initialize_floorplan \
  -flip_first_row true \
  -boundary {{0 0} {480 520}} \
  -core_offset {20 20 20 20}


##########################################################################################
# POSICIONAMIENTO DE SRAMS
##########################################################################################
#set obj [get_cells -hierarchical *myram*]
#move_objects [index_collection $obj end] -x 1 -y 352
#move_objects [index_collection $obj end-1] -x 43 -y 352
#move_objects [index_collection $obj end-2] -x 85 -y 352
#move_objects [index_collection $obj end-3] -x 127 -y 352
#move_objects [index_collection $obj end-4] -x 169 -y 352
#move_objects [index_collection $obj end-5] -x 407 -y 352
#move_objects [index_collection $obj end-6] -x 365 -y 352
#move_objects [index_collection $obj end-7] -x 323 -y 352
#move_objects [index_collection $obj end-8] -x 281 -y 352
#move_objects [index_collection $obj end-9] -x 239 -y 352
#move_objects [index_collection $obj end-10] -x 365 -y 170
#move_objects [index_collection $obj end-11] -x 407 -y 170
#move_objects [index_collection $obj end-12] -x 85 -y 170
#move_objects [index_collection $obj end-13] -x 43 -y 170
#move_objects [index_collection $obj end-14] -x 1 -y 170
#move_objects [index_collection $obj end-15] -x 239 -y 1
#move_objects [index_collection $obj end-16] -x 281 -y 1
#move_objects [index_collection $obj end-17] -x 323 -y 1
#move_objects [index_collection $obj end-18] -x 365 -y 1
#move_objects [index_collection $obj end-19] -x 407 -y 1
#move_objects [index_collection $obj end-20] -x 169 -y 1
#move_objects [index_collection $obj end-21] -x 127 -y 1
#move_objects [index_collection $obj end-22] -x 85 -y 1
#move_objects [index_collection $obj end-23] -x 43 -y 1
#move_objects [index_collection $obj end-24] -x 1 -y 1

set obj [get_cells -hierarchical *myram*]
move_objects [index_collection $obj end] -x 2 -y 352
move_objects [index_collection $obj end-1] -x 45 -y 352
move_objects [index_collection $obj end-2] -x 88 -y 352
rotate_objects [index_collection $obj end-3] -orient W
move_objects [index_collection $obj end-3] -x 137 -y 477.5
move_objects [index_collection $obj end-4] -x 438 -y 352
move_objects [index_collection $obj end-5] -x 395 -y 352
move_objects [index_collection $obj end-6] -x 352 -y 352
move_objects [index_collection $obj end-7] -x 309 -y 352
move_objects [index_collection $obj end-8] -x 438 -y 173
rotate_objects [index_collection $obj end-9] -orient E
rotate_objects [index_collection $obj end-10] -orient E
move_objects [index_collection $obj end-9] -x 137 -y 435.5
move_objects [index_collection $obj end-10] -x 137 -y 393.5
move_objects [index_collection $obj end-11] -x 86 -y 173
move_objects [index_collection $obj end-12] -x 44 -y 173
move_objects [index_collection $obj end-13] -x 2 -y 173
move_objects [index_collection $obj end-24] -x 266 -y 2
move_objects [index_collection $obj end-20] -x 309 -y 2
move_objects [index_collection $obj end-19] -x 352 -y 2
move_objects [index_collection $obj end-17] -x 395 -y 2
move_objects [index_collection $obj end-18] -x 438 -y 2
move_objects [index_collection $obj end-23] -x 217 -y 2
move_objects [index_collection $obj end-22] -x 174 -y 2
move_objects [index_collection $obj end-21] -x 131 -y 2
move_objects [index_collection $obj end-14] -x 88 -y 2
move_objects [index_collection $obj end-15] -x 45 -y 2
move_objects [index_collection $obj end-16] -x 2 -y 2
rotate_objects [index_collection $obj end-24] -orient S
rotate_objects [index_collection $obj end-20] -orient S
rotate_objects [index_collection $obj end-19] -orient S
rotate_objects [index_collection $obj end-17] -orient S
rotate_objects [index_collection $obj end-18] -orient S
rotate_objects [index_collection $obj end-23] -orient S
rotate_objects [index_collection $obj end-22] -orient S
rotate_objects [index_collection $obj end-21] -orient S
rotate_objects [index_collection $obj end-14] -orient S
rotate_objects [index_collection $obj end-15] -orient S
rotate_objects [index_collection $obj end-16] -orient S
rotate_objects [index_collection $obj end] -angle MY
rotate_objects [index_collection $obj end-1] -angle MY
rotate_objects [index_collection $obj end-2] -angle MY
rotate_objects [index_collection $obj end-11] -angle MY
rotate_objects [index_collection $obj end-12] -angle MY
rotate_objects [index_collection $obj end-13] -angle MY
rotate_objects [index_collection $obj end-18] -angle MY
rotate_objects [index_collection $obj end-17] -angle MY
rotate_objects [index_collection $obj end-19] -angle MY
rotate_objects [index_collection $obj end-20] -angle MY
rotate_objects [index_collection $obj end-24] -angle MY


##########################################################################################
# BLOQUEOS DE PLACEMENT
##########################################################################################
create_placement_blockage -type hard -boundary [get_cells -hierarchical *myram*]

set_fixed_objects [get_cells -hierarchical *myram*] 

create_keepout_margin -type hard -outer {5 5 5 5} [get_cells -hierarchical *myram*]

#Soft blockages
create_placement_blockage -type soft -boundary {{259 0} {266 173}}
create_placement_blockage -type soft -boundary {{0 340} {131 352}}
create_placement_blockage -type soft -boundary {{433 340} {480 352}}


##########################################################################################
# SELECCIONAR CELDAS PARA HACER GUIDE
##########################################################################################

#Amber0
#Para hacer soft guide de todo el core
set cells_amber0 [get_cells u_amber0/*] 

#Para hacer hard guide de las etapas que generan caminos críticos 
set cells_etapa_fetch_amber0 [get_cells u_amber0/u_fetch/*]
set cells_etapa_decode_amber0 [get_cells u_amber0/u_decode/*]
set cells_etapa_exe_amber0 [get_cells u_amber0/u_execute/*]
set cells_etapa_mem_amber0 [get_cells u_amber0/u_mem/*]

#Amber1
#Para hacer soft guide de todo el core
set cells_amber1 [get_cells u_amber1/*]

set cells_etapa_fetch_amber1 [get_cells u_amber1/u_fetch/*]
set cells_etapa_decode_amber1 [get_cells u_amber1/u_decode/*]
set cells_etapa_exe_amber1 [get_cells u_amber1/u_execute/*]
set cells_etapa_mem_amber1 [get_cells u_amber1/u_mem/*]


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

##########################################################################################
# CREAR LOS HARD Y SOFT GUIDES
##########################################################################################
create_placement_attraction -name place_amber0 -effort high "$cells_etapa_exe_amber0 $cells_etapa_mem_amber0"
create_placement_attraction -name place_amber1 -effort high "$cells_etapa_exe_amber1 $cells_etapa_mem_amber1"
create_placement_attraction -name all_amber0 -effort medium $cells_amber0
create_placement_attraction -name all_amber1 -effort medium $cells_amber1

