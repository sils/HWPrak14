@echo off


rem  PlanAhead(TM)
rem  runme.bat: a PlanAhead-generated ISim simulation Script
rem  Copyright 1986-1999, 2001-2012 Xilinx, Inc. All Rights Reserved.


set PATH=%XILINX%\lib\%PLATFORM%;%XILINX%\bin\%PLATFORM%;C:/Xilinx/14.6/ISE_DS/EDK/bin/nt64;C:/Xilinx/14.6/ISE_DS/EDK/lib/nt64;C:/Xilinx/14.6/ISE_DS/ISE/bin/nt64;C:/Xilinx/14.6/ISE_DS/ISE/lib/nt64;C:/Xilinx/14.6/ISE_DS/common/bin/nt64;C:/Xilinx/14.6/ISE_DS/common/lib/nt64;C:/Xilinx/14.6/ISE_DS/PlanAhead/bin;%PATH%

set XILINX_PLANAHEAD=C:/Xilinx/14.6/ISE_DS/PlanAhead

fuse -intstyle pa -incremental -L work -L secureip -o LEDPWM_tb.exe --prj H:/Xilinx/project_2/project_2.sim/sim_1/behav/LEDPWM_tb.prj -top work.LEDPWM_tb
if errorlevel 1 (
   cmd /c exit /b %errorlevel%
)
