##########################################################################################
#        ECO , CAMBIOS MANUALES
##########################################################################################

# Se crea una coleccion con todos los timing paths que tienen violaciones de min
set ccm [get_timing_paths -delay_type min -slack_lesser_than 0 -max_paths 500]

# crea un iterador que tienene la cantidad de caminos que tienen una violacion de min
set iterador [sizeof_collection $ccm]

# Se crea un while que inserta buffers hasta que ya no queda ningun camino con violaciones de min
while {$iterador > 0} { set ccm [get_timing_paths -delay_type min -slack_lesser_than 0 -max_paths 500]; insert_buffer [get_attribute $ccm endpoint_name] -lib_cell saed14hvt_frame_timing_ccs/SAEDHVT14_BUF_ECO_1 -new_net_names Net_Prueba -new_cell_names Celda_Prueba; set iterador [sizeof_collection $ccm]; puts $iterador }

# Se legaliza el placement de los buffers
legalize_placement -cells [get_cells *BUF*]

