create_project -force Automation [pwd]/Automation -part xc7a35tcpg236-1
set_property board_part digilentinc.com:basys3:part0:1.1 [current_project]
update_compile_order -fileset sources_1

set argv [glob -directory Modules ~ *]

foreach module_name $argv {
  add_files -norecurse [pwd]/$module_name
    update_compile_order -fileset sources_1

}

close_project
