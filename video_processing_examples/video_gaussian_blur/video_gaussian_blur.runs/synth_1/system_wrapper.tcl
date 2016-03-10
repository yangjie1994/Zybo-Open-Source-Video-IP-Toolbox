# 
# Synthesis run script generated by Vivado
# 

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7z010clg400-1

set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir D:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.cache/wt [current_project]
set_property parent.project_path D:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.xpr [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property board_part digilentinc.com:zybo:part0:1.0 [current_project]
set_property ip_repo_paths d:/Users/Rob/Documents/Class/ECEC662/video_processing_ip [current_project]
set_property vhdl_version vhdl_2k [current_fileset]
add_files D:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.srcs/sources_1/bd/system/system.bd
set_property used_in_implementation false [get_files -all d:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.srcs/sources_1/bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0_board.xdc]
set_property used_in_implementation false [get_files -all d:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.srcs/sources_1/bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0.xdc]
set_property used_in_implementation false [get_files -all d:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.srcs/sources_1/bd/system/ip/system_clk_wiz_0_0/system_clk_wiz_0_0_ooc.xdc]
set_property used_in_implementation false [get_files -all d:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.srcs/sources_1/bd/system/ip/system_processing_system7_0_0/system_processing_system7_0_0.xdc]
set_property used_in_implementation false [get_files -all D:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.srcs/sources_1/bd/system/system_ooc.xdc]
set_property is_locked true [get_files D:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.srcs/sources_1/bd/system/system.bd]

read_vhdl -library xil_defaultlib D:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.srcs/sources_1/bd/system/hdl/system_wrapper.vhd
read_xdc D:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.srcs/constrs_1/new/zybo_breakout.xdc
set_property used_in_implementation false [get_files D:/Users/Rob/Documents/Class/ECEC662/video_processing_examples/video_gaussian_blur/video_gaussian_blur.srcs/constrs_1/new/zybo_breakout.xdc]

read_xdc dont_touch.xdc
set_property used_in_implementation false [get_files dont_touch.xdc]
synth_design -top system_wrapper -part xc7z010clg400-1
write_checkpoint -noxdef system_wrapper.dcp
catch { report_utilization -file system_wrapper_utilization_synth.rpt -pb system_wrapper_utilization_synth.pb }
