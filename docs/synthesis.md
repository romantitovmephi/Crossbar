# Отчет о синтезе (Cyclone IV E)

### Summary

| Analysis & Synthesis Status        | Successful - Sun Aug 14 15:05:23 2022       |
| ---------------------------------- | ------------------------------------------- |
| Quartus Prime Version              | 21.1.0 Build 842 10/21/2021 SJ Lite Edition |
| Revision Name                      | crossbar                                    |
| Top-level Entity Name              | crossbar                                    |
| Family                             | Cyclone IV E                                |
| Total logic elements               | 659                                         |
| Total registers                    | 15                                          |
| Total pins                         | 802                                         |
| Total virtual pins                 | 0                                           |
| Total memory bits                  | 0                                           |
| Embedded Multiplier 9-bit elements | 0                                           |
| Total PLLs                         | 0                                           |

### Source File Read

|  File Name  | Used |         Type          |
| ------------------------------------------ | 
| crossbar.v  | yes  | User Verilog HDL File |
| arbiter.sv  | yes  | User Verilog HDL File |

### Resource Usage Summary

|                  Resource                   | Usage |
| ------------------------------------------- | ----- |
| Estimated Total logic elements              |  659  |
|                                             |       |
| Total combinational functions               |  655  |
| Logic element usage by number of LUT inputs |       |
| 4 input functions                           |  253  |
| 3 input functions                           |   3   |
| <=2 input functions                         |  399  |
|                                             |       |
| Logic elements by mode                      |       |
| normal mode                                 |  655  |
| arithmetic mode                             |   0   |
|                                             |       |
| Total registers                             |  15   |
| Dedicated logic registers                   |  15   |
| I/O registers                               |   0   |
|                                             |       |
| I/O pins                                    |  802  |
|                                             |       |
| Embedded Multiplier 9-bit elements          |   0   |


### Resource Utilization by Entity

| Node | Combinational ALUTs | Dedicated Logic Registers | Memory Bits | DSP Elements | DSP 9x9 | DSP 18x18 | Pins | Virtual Pins |
|-|-|-|-|-|-|-|-|-|
| crossbar      | 655 (633) | 15 (8)  | 0 | 0 | 0 | 0 | 802 | 0 |
| arbiter:arb   | 22 (22)   | 7 (7)   | 0 | 0 | 0 | 0 | 0   | 0 |

### General Register Statistics

| Statistic | Value |
| -------------------------------------------- | -- |
| Total registers                              | 15 |
| Number of registers using Synchronous Clear  | 0  |
| Number of registers using Synchronous Load   | 0  |
| Number of registers using Asynchronous Clear | 0  |
| Number of registers using Asynchronous Load  | 0  |
| Number of registers using Clock Enable       | 2  |
| Number of registers using Preset             | 0  |

### MUX Restructuring Statistics

| MUX Inputs | Bus Width | Baseline Area | Area if Restucted | Saving if Restructed | Registered | Example MUX Output |
| ----- | ------- | ------- | ------- | ----- | ---- | ------------------------------ |
| 3:1 | 2 bits  | 4 LEs   | 2 LEs   | 2 LEs | Yes | ||crossbar|arbiter:arb|mask1 |
| 5:1 | 32 bits  | 96 LEs   | 64 LEs   | 32 LEs | No  | |crossbar|master_0_rdata |
| 5:1 | 65 bits  | 195 LEs   | 130 LEs   | 65 LEs | No  | |crossbar|slave_0_addr |
| 7:1 | 2 bits  | 8 LEs   | 4 LEs   | 4 LEs | No  | |crossbar|master_read |

### Post-Synthesis Netlist Statistics

| Type | Count |
| ----------------------- | ------ |
| boundary_port           | 802    |
| cycloneiii_ff           | 15     |
| ENA                     | 2      |
| plain                   | 13     |
| cycloneiii_lcell_comb   | 655    |
| normal                  | 655    |
| 2 data inputs           | 399    |
| 3 data inputs           | 3      |
| 4 data inputs           | 253    |
|                         |        |
| Max LUT depth           | 4.00   |
| Average LUT depth       | 3.37   |

### Elapsed Time Partition

| Name | Elapsed Time |
| ----------------------- | ------ |
| Top | 00:00:01 |


[На главную](https://github.com/romantitovmephi/Crossbar/blob/main/README.md)