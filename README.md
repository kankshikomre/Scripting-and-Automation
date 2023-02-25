# Scripting-and-Automation
An Automatic Library Evaluation Framework that automates the synthesis flow of the Xilinx Vivado Tool. The script takes Verilog Files as Input and Synthesizes all of them. The area, power, and delay report is generated for all the designs and combined in the form of a CSV file.

# Scripting
There are two files present for scripting: add_tcl.tcl and run_tcl.tcl

"add_tcl.tcl" creates a new project Automation in Xilinx vivado with board part Basys3. The language of sources is set as SystemVerilog. Then all the files present in directory Modules are added to the project.

"run_tcl.tcl" opens the project and sets one of the files as top files. Then it starts to synthesize the top file which continues with the implementation. After implementation, power.txt, timing.txt and utilization.txt reports are generated for the top file.

# Automation
The programming language used here for automation is python.
