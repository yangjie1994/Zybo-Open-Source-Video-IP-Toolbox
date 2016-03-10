proc start_step { step } {
  set stopFile ".stop.rst"
  if {[file isfile .stop.rst]} {
    puts ""
    puts "*** Halting run - EA reset detected ***"
    puts ""
    puts ""
    return -code error
  }
  set beginFile ".$step.begin.rst"
  set platform "$::tcl_platform(platform)"
  set user "$::tcl_platform(user)"
  set pid [pid]
  set host ""
  if { [string equal $platform unix] } {
    if { [info exist ::env(HOSTNAME)] } {
      set host $::env(HOSTNAME)
    }
  } else {
    if { [info exist ::env(COMPUTERNAME)] } {
      set host $::env(COMPUTERNAME)
    }
  }
  set ch [open $beginFile w]
  puts $ch "<?xml version=\"1.0\"?>"
  puts $ch "<ProcessHandle Version=\"1\" Minor=\"0\">"
  puts $ch "    <Process Command=\".planAhead.\" Owner=\"$user\" Host=\"$host\" Pid=\"$pid\">"
  puts $ch "    </Process>"
  puts $ch "</ProcessHandle>"
  close $ch
}

proc end_step { step } {
  set endFile ".$step.end.rst"
  set ch [open $endFile w]
  close $ch
}

proc step_failed { step } {
  set endFile ".$step.error.rst"
  set ch [open $endFile w]
  close $ch
}

set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000

start_step init_design
set rc [catch {
  create_msg_db init_design.pb
  create_project -in_memory -part xc7z010clg400-1
  set_property board_part digilentinc.com:zybo:part0:1.0 [current_project]
  set_property design_mode GateLvl [current_fileset]
  set_property webtalk.parent_dir D:/Users/Rob/Documents/Class/ECEC662/video_processing_ip/vga_color_test/vga_color_test.cache/wt [current_project]
  set_property parent.project_path D:/Users/Rob/Documents/Class/ECEC662/video_processing_ip/vga_color_test/vga_color_test.xpr [current_project]
  set_property ip_repo_paths d:/Users/Rob/Documents/Class/ECEC662/video_processing_ip/vga_color_test/vga_color_test.cache/ip [current_project]
  set_property ip_output_repo d:/Users/Rob/Documents/Class/ECEC662/video_processing_ip/vga_color_test/vga_color_test.cache/ip [current_project]
  add_files -quiet D:/Users/Rob/Documents/Class/ECEC662/video_processing_ip/vga_color_test/vga_color_test.runs/synth_1/vga_color_test.dcp
  link_design -top vga_color_test -part xc7z010clg400-1
  close_msg_db -file init_design.pb
} RESULT]
if {$rc} {
  step_failed init_design
  return -code error $RESULT
} else {
  end_step init_design
}

start_step opt_design
set rc [catch {
  create_msg_db opt_design.pb
  catch {write_debug_probes -quiet -force debug_nets}
  opt_design 
  write_checkpoint -force vga_color_test_opt.dcp
  report_drc -file vga_color_test_drc_opted.rpt
  close_msg_db -file opt_design.pb
} RESULT]
if {$rc} {
  step_failed opt_design
  return -code error $RESULT
} else {
  end_step opt_design
}

start_step place_design
set rc [catch {
  create_msg_db place_design.pb
  catch {write_hwdef -file vga_color_test.hwdef}
  place_design 
  write_checkpoint -force vga_color_test_placed.dcp
  report_io -file vga_color_test_io_placed.rpt
  report_utilization -file vga_color_test_utilization_placed.rpt -pb vga_color_test_utilization_placed.pb
  report_control_sets -verbose -file vga_color_test_control_sets_placed.rpt
  close_msg_db -file place_design.pb
} RESULT]
if {$rc} {
  step_failed place_design
  return -code error $RESULT
} else {
  end_step place_design
}

start_step route_design
set rc [catch {
  create_msg_db route_design.pb
  route_design 
  write_checkpoint -force vga_color_test_routed.dcp
  report_drc -file vga_color_test_drc_routed.rpt -pb vga_color_test_drc_routed.pb
  report_timing_summary -warn_on_violation -max_paths 10 -file vga_color_test_timing_summary_routed.rpt -rpx vga_color_test_timing_summary_routed.rpx
  report_power -file vga_color_test_power_routed.rpt -pb vga_color_test_power_summary_routed.pb
  report_route_status -file vga_color_test_route_status.rpt -pb vga_color_test_route_status.pb
  report_clock_utilization -file vga_color_test_clock_utilization_routed.rpt
  close_msg_db -file route_design.pb
} RESULT]
if {$rc} {
  step_failed route_design
  return -code error $RESULT
} else {
  end_step route_design
}
