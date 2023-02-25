import os
import pandas as pd
import numpy as np
import matplotlib.pyplot as plt
import datetime
import shutil

files = os.listdir("Modules")
files = [file for file in files if ".sv" in file]
top_modules = [file for file in files if "top" in file]

os.system("vivado -mode batch -source ../Scripting/tcl_add.tcl -tclargs {}".format(top_modules))

for mod in top_modules:
    if os.path.exists("Impl/" + mod[:-3]):
        shutil.rmtree("Impl/" + mod[:-3])
        
    os.mkdir("Impl/" + mod[:-3])
    
for mod in top_modules:
    os.system("vivado -mode batch -source ../Scripting/tcl_run.tcl -tclargs {}".format(mod))
    print("{} is Implmented and Reports are generated".format(mod))
    
SignalPower = []
LogicPower = []
StaticPower = []
DCPower = []
TotalPower = []
DatapathDelay = []
F7Muxes = []
LUTMemory = []
LUTLogic = []
SliceLUT = []
LUT1 = []
LUT2 = []
LUT3 = []
LUT4 = []
LUT5 = []
LUT6 = []
LUT7 = []
LUTLogic2 = []
SliceLUT2 = []
LUTDifference = []

for mod in top_modules:
    with open("Impl/{}/power.txt".format(mod[:-3])) as f:
        lines = f.read()
        power = lines.split("\n")
        #Signal Power
        signal_power_info = [line for line in power if "Signals" in line]
        sigpi = float(signal_power_info[0].split()[3])
        #Logic Power
        logic_power_info = [line for line in power if "Slice Logic" in line]
        lpi = float(logic_power_info[0].split()[4])
        #Static Power
        static_power_info = [line for line in power if "Static Power" in line]
        stapi = float(static_power_info[0].split()[4])
        #DC Power
        DC_power = sigpi + lpi
        #Total Power
        total_power_info = [line for line in power if "Total On-Chip Power" in line]
        tpi = float(total_power_info[0].split()[6])

        SignalPower.append(sigpi)
        LogicPower.append(lpi)
        StaticPower.append(stapi)
        DCPower.append(DC_power)
        TotalPower.append(tpi)
        
    with open("Impl/{}/timing.txt".format(mod[:-3])) as f:
        lines = f.read()
        timing = lines.split("\n")
        timing_info = [line for line in timing if "Data Path Delay" in line]
        dpd = float(timing_info[0].split()[3][:-2])
        DatapathDelay.append(dpd)
        
    with open("Impl/{}/utilization.txt".format(mod[:-3])) as f:
        lines = f.read()
        utilization = lines.split("\n")
        #F7 Muxes
        f7mux_utilization_info = [line for line in utilization if "F7 Muxes" in line]
        f7mux = int(f7mux_utilization_info[0].split()[4])
        #LUT Memory
        lutm_utilization_info = [line for line in utilization if "LUT as Memory" in line]
        lutm = int(lutm_utilization_info[0].split()[5])
        #LUT Logic
        lutl_utilization_info = [line for line in utilization if "LUT as Logic" in line]
        lutl = int(lutl_utilization_info[0].split()[5])
        #Slice LUT
        s_lut_utilization_info = [line for line in utilization if "Slice LUTs" in line]
        s_lut = int(s_lut_utilization_info[0].split()[4])
        #LUT 1
        lut1_utilization_info = [line for line in utilization if "LUT1" in line]
        if not lut1_utilization_info:
            lut_1 = 0
        else:
            lut_1 = int(lut1_utilization_info[0].split()[3])
        #LUT 2
        lut2_utilization_info = [line for line in utilization if "LUT2" in line]
        if not lut2_utilization_info:
            lut_2 = 0
        else:
            lut_2 = int(lut2_utilization_info[0].split()[3])
        #LUT 3
        lut3_utilization_info = [line for line in utilization if "LUT3" in line]
        if not lut3_utilization_info:
            lut_3 = 0
        else:
            lut_3 = int(lut3_utilization_info[0].split()[3])
        #LUT 4
        lut4_utilization_info = [line for line in utilization if "LUT4" in line]
        if not lut4_utilization_info:
            lut_4 = 0
        else:
            lut_4 = int(lut4_utilization_info[0].split()[3])
        #LUT 5
        lut5_utilization_info = [line for line in utilization if "LUT5" in line]
        if not lut5_utilization_info:
            lut_5 = 0
        else:
            lut_5 = int(lut5_utilization_info[0].split()[3])
        #LUT 6
        lut6_utilization_info = [line for line in utilization if "LUT6" in line]
        if not lut6_utilization_info:
            lut_6 = 0
        else:
            lut_6 = int(lut6_utilization_info[0].split()[3])
        #LUT 7
        lut7_utilization_info = [line for line in utilization if "LUT7" in line]
        if not lut7_utilization_info:
            lut_7 = 0
        else:
            lut_7 = int(lut7_utilization_info[0].split()[3])
        #LUT Logic 2
        lutl2 = int(lut_1 + lut_2 + lut_3 + lut_4 + lut_5 + lut_6 + lut_7)
        #Slice LUT 2
        s_lut2 = int(lut_1 + lut_2 + lut_3 + lut_4 + lut_5 + lut_6 + lut_7)
        #LUT Difference
        lut_diff = int(lutl2 - lutl)
        
        F7Muxes.append(f7mux)
        LUTMemory.append(lutm)
        LUTLogic.append(lutl)
        SliceLUT.append(s_lut)
        LUT1.append(lut_1)
        LUT2.append(lut_2)
        LUT3.append(lut_3)
        LUT4.append(lut_4)
        LUT5.append(lut_5)
        LUT6.append(lut_6)
        LUT7.append(lut_7)
        LUTLogic2.append(lutl2)
        SliceLUT2.append(s_lut2)
        LUTDifference.append(lut_diff)
        
result = [SignalPower, LogicPower, StaticPower, DCPower, TotalPower, DatapathDelay, F7Muxes, LUTMemory, LUTLogic, SliceLUT, LUT1, LUT2, LUT3, LUT4, LUT5, LUT6, LUT7, LUTLogic2, SliceLUT2, LUTDifference]
resultT = np.array(result).T
heading = ["Signal Power(w)", "Logic Power(w)", "Static Power(w)", "DC Power(w)", "Total Power(w)", "DataPath Delay", "F7_Muxes", "LUT_as_Memory", "LUT_as_Logic", "Slice_LUTs", "LUT1", "LUT2", "LUT3", "LUT4", "LUT5", "LUT6", "LUT7", "LUT_as_Logic2", "Slice_LUTs2", "LUTs_difference"]
df = pd.DataFrame(resultT)
df.columns = heading
df.insert(loc=0, column='File Name', value=top_modules)

df.to_csv("Automation_Result.csv")
