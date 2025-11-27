##########################################################################################
#        ECO , CAMBIOS MANUALES
##########################################################################################

#size_cell <LISTA DE CELDAS A CAMBIAR EL TAMAÑO> <CELDA POR LA QUE SE SUSTITUIRÁ>
#insert_buffer <LISTA DE NETS, PINES, ETC QUE DEBEN BUFFERASE> -lib_cell <CELDA DE BUFFER A INSERTAR> -new_net_names <NOMBRE DE LA NET NUEVA> -new_cell_names <NOMBRE DE LAS CELDAS NUECAS>

#get_lib_cells saed14hvt_frame_timing_ccs/BUF

#report_lib_cells -objects saed14hvt_frame_timing_ccs/SAEDHVT14_AOBUF_IW_0P75

#get_pins -of_objects [get_cells u_amber0/u_execute/u_register_bank/r13_irq_reg_31_]


#set ccm [get_timing_paths -delay_type min -max_paths 5]
#size_cell <LISTA DE CELDAS A CAMBIAR EL TAMAÑO> <CELDA POR LA QUE SE SUSTITUIRÁ>
#insert_buffer [get_attribute $ccm endpoint_name] -lib_cell saed14rvt_frame_timing_ccs/SAEDRVT14_AOBUF_IW_0P75 -new_net_names Net_Prueba -new_cell_names Celda_Prueba

#Para max
#insert_buffer u_amber0/u_execute/u_register_bank/r13_irq_reg_31_/CK -lib_cell saed14hvt_frame_timing_ccs/SAEDHVT14_AOBUF_IW_0P75 -new_net_names Net_Prueba -new_cell_names Celda_Prueba

#Ver pines de las srams
set obj [get_cells -hierarchical myram]

# se seleccionan los pines de estas srams
set pintest [get_pins -of_objects $obj]

# se pone todo en la GUI
change_selection $pintest


set ccm [get_timing_paths -delay_type min -slack_lesser_than 0 -max_paths 500]
set iterador [sizeof_collection $ccm]

while {$iterador > 0} { set ccm [get_timing_paths -delay_type min -slack_lesser_than 0 -max_paths 500]; insert_buffer [get_attribute $ccm endpoint_name] -lib_cell saed14hvt_frame_timing_ccs/SAEDHVT14_BUF_ECO_1 -new_net_names Net_Prueba -new_cell_names Celda_Prueba; set iterador [sizeof_collection $ccm]; puts $iterador }

remove_buffer u_amber0/u_execute/u_register_bank/Celda_Prueba_158_144
legalize_placement -cells [get_cells BUF]

set ccm [get_timing_paths -delay_type max -slack_lesser_than 0 -max_paths 500]
set iterador [sizeof_collection $ccm]
