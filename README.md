# Scripting-and-Automation
An Automatic Library Evaluation Framework that automates the synthesis flow of the Xilinx Vivado Tool. The script takes Verilog Files as Input and Synthesizes all of them. The area, power, and delay report is generated for all the designs and combined in the form of a CSV file.

## Scripting
There are two files present for scripting: **add_tcl.tcl** and **run_tcl.tcl**

**add_tcl.tcl** creates a new project Automation in Xilinx vivado with board part Basys3. The language of sources is set as SystemVerilog. Then all the files with format `top_modules` in directory Modules are added to the project.

**"run_tcl.tcl"** opens the project and sets one of the files as top files. Then it starts to synthesize the top file which continues with the implementation. After implementation, power.txt, timing.txt and utilization.txt reports are generated for the top file.

## Automation
The programming language used here for automation is python.

**All the files to be added in Vivado must be present in directory Modules.**

First import all the useful libraries for the code. The code starts with making a list `top_modules` by sorting all the files in directory Modules. Sorting is based on the filename starting with top_#### and filetype as .sv file. Then run the scripting file **add_tcl.tcl** to add the files mentioned in `top_module` in the project. Next create a directory for each design with the name same as the original file name (removes .sv). If a directory with the provided name already exists then it deletes the directory and creates a new one with the provided name. Now, run the scripting file **run_tcl.tcl** to synthesize and implement all the designs. Power.txt, timing.txt and utilization.txt reports are generated for every design and stored in the directories created earlier as per the names.

**NOTE:** The completion of synthesis and implentation for every design may take a while depending on the number of files and size.

After generating all the reports, you can extract the required data for each design and append them in lists. These lists can be used to create a datatable for every design. You can also provide the headings for the table. At last, download the datatable in .csv file format.


The Datatable obtained looks like this: 
![image](https://user-images.githubusercontent.com/94683003/221362528-81d27e4f-e18a-4bf7-a465-05f4cc1a9dcc.png)

