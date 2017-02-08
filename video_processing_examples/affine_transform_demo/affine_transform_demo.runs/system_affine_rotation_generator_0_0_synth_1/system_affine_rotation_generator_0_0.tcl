# 
# Synthesis run script generated by Vivado
# 

set_param xicom.use_bs_reader 1
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z010clg400-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.cache/wt [current_project]
set_property parent.project_path C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.xpr [current_project]
set_property XPM_LIBRARIES XPM_CDC [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:zybo:part0:1.0 [current_project]
set_property ip_repo_paths {
  c:/Zybo-Open-Source-Video-IP-Toolbox/general_ip
  c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_ip
} [current_project]
set_property ip_output_repo c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_ip -quiet c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0.xci
set_property is_locked true [get_files c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0.xci]

foreach dcp [get_files -quiet -all *.dcp] {
  set_property used_in_implementation false $dcp
}

set cached_ip [config_ip_cache -export -no_bom -use_project_ipc -dir C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.runs/system_affine_rotation_generator_0_0_synth_1 -new_name system_affine_rotation_generator_0_0 -ip [get_ips system_affine_rotation_generator_0_0]]

if { $cached_ip eq {} } {

synth_design -top system_affine_rotation_generator_0_0 -part xc7z010clg400-1 -mode out_of_context

#---------------------------------------------------------
# Generate Checkpoint/Stub/Simulation Files For IP Cache
#---------------------------------------------------------
catch {
 write_checkpoint -force -noxdef -rename_prefix system_affine_rotation_generator_0_0_ system_affine_rotation_generator_0_0.dcp

 set ipCachedFiles {}
 write_verilog -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_affine_rotation_generator_0_0_stub.v
 lappend ipCachedFiles system_affine_rotation_generator_0_0_stub.v

 write_vhdl -force -mode synth_stub -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_affine_rotation_generator_0_0_stub.vhdl
 lappend ipCachedFiles system_affine_rotation_generator_0_0_stub.vhdl

 write_verilog -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_affine_rotation_generator_0_0_sim_netlist.v
 lappend ipCachedFiles system_affine_rotation_generator_0_0_sim_netlist.v

 write_vhdl -force -mode funcsim -rename_top decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix -prefix decalper_eb_ot_sdeen_pot_pi_dehcac_xnilix_ system_affine_rotation_generator_0_0_sim_netlist.vhdl
 lappend ipCachedFiles system_affine_rotation_generator_0_0_sim_netlist.vhdl

 config_ip_cache -add -dcp system_affine_rotation_generator_0_0.dcp -move_files $ipCachedFiles -use_project_ipc -ip [get_ips system_affine_rotation_generator_0_0]
}

rename_ref -prefix_all system_affine_rotation_generator_0_0_

write_checkpoint -force -noxdef system_affine_rotation_generator_0_0.dcp

catch { report_utilization -file system_affine_rotation_generator_0_0_utilization_synth.rpt -pb system_affine_rotation_generator_0_0_utilization_synth.pb }

if { [catch {
  file copy -force C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.runs/system_affine_rotation_generator_0_0_synth_1/system_affine_rotation_generator_0_0.dcp c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  write_verilog -force -mode synth_stub c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode synth_stub c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  write_verilog -force -mode funcsim c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  write_vhdl -force -mode funcsim c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}


} else {


if { [catch {
  file copy -force C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.runs/system_affine_rotation_generator_0_0_synth_1/system_affine_rotation_generator_0_0.dcp c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0.dcp
} _RESULT ] } { 
  send_msg_id runtcl-3 error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
  error "ERROR: Unable to successfully create or copy the sub-design checkpoint file."
}

if { [catch {
  file rename -force C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.runs/system_affine_rotation_generator_0_0_synth_1/system_affine_rotation_generator_0_0_stub.v c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0_stub.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a Verilog synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.runs/system_affine_rotation_generator_0_0_synth_1/system_affine_rotation_generator_0_0_stub.vhdl c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0_stub.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create a VHDL synthesis stub for the sub-design. This may lead to errors in top level synthesis of the design. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.runs/system_affine_rotation_generator_0_0_synth_1/system_affine_rotation_generator_0_0_sim_netlist.v c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0_sim_netlist.v
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the Verilog functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

if { [catch {
  file rename -force C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.runs/system_affine_rotation_generator_0_0_synth_1/system_affine_rotation_generator_0_0_sim_netlist.vhdl c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0_sim_netlist.vhdl
} _RESULT ] } { 
  puts "CRITICAL WARNING: Unable to successfully create the VHDL functional simulation sub-design file. Post-Synthesis Functional Simulation with this file may not be possible or may give incorrect results. Error reported: $_RESULT"
}

}; # end if cached_ip 

if {[file isdir C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.ip_user_files/ip/system_affine_rotation_generator_0_0]} {
  catch { 
    file copy -force c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0_stub.v C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.ip_user_files/ip/system_affine_rotation_generator_0_0
  }
}

if {[file isdir C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.ip_user_files/ip/system_affine_rotation_generator_0_0]} {
  catch { 
    file copy -force c:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.srcs/sources_1/bd/system/ip/system_affine_rotation_generator_0_0/system_affine_rotation_generator_0_0_stub.vhdl C:/Zybo-Open-Source-Video-IP-Toolbox/video_processing_examples/affine_transform_demo/affine_transform_demo.ip_user_files/ip/system_affine_rotation_generator_0_0
  }
}
