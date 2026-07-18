# Custom 8-bit Processor in Verilog

A custom 8-bit accumulator-based processor designed in Verilog HDL having arithmetic, logical, memory access, and branching instructions. The processor was functionally verified using Icarus Verilog and GTKWave and synthesized using Xilinx Vivado.

## Repository Structure
```
8bit_Processor/
│
├── codes/
│   ├── cpu_top.v              # Processor integration at top-level
│   ├── control_fsm.v          # Fetch-Decode-Execute Control FSM
│   ├── alu.v                  # Arithmetic Logic Unit
│   ├── pc.v                   # Program Counter
│   ├── ins_reg.v              # Instruction Register
│   ├── 8bit_reg.v             # 8-bit Register
│   ├── flag_reg.v             # Carry and Zero Flag Register
│   ├── ram.v                  # Data Memory
│   └── insmem.v               # Instruction Memory
│    
│
├── tb/
│   ├── cpu_top_tb.v
│   ├── alu_tb.v
│   ├── control_fsm_tb.v
│   ├── insmem_tb.v
│   ├── pc_tb.v
│   ├── insreg_tb.v
│   ├── fetch_tb.v
│   └── 8bit_reg_tb.v
│
├── simulation/
│   ├── dump_cpu.vcd
│   ├── dump_fsm.vcd
│   ├── dump_im.vcd
│   ├── alu_dump.vcd
│   ├── dump_ir.vcd
│   ├── pc_dump.vcd
│   └── fetch_dump.vcd
│   
│
├── vivado/
│   └── Utilization_Report.pdf
│
├── pics/
│   ├── Schematic.png
│   ├── Utilization.png
│   └── Timing.png   
│
├── LICENSE
└── README.md
```

## Processor Features

- 8-bit Architecture
- Verilog HDL Implementation
- Three-stage FSM (Fetch, Decode, Execute)
- Program Counter
- Instruction Register
- Data RAM
- Instruction ROM
- Accumulator-based Datapath
- Arithmetic Logic Unit
- Carry Flag
- Zero Flag
- Conditional Branching
- Simulated using Icarus Verilog + GTKWave
- Synthesized using Xilinx Vivado

## Instruction Set

| Opcode | Instruction |
|---------|-------------|
|0000|LOAD Immediate|
|0001|LOAD Memory|
|0010|STORE Memory|
|0011|ADD|
|0100|SUB|
|0101|AND|
|0110|OR|
|0111|XOR|
|1000|NOT|
|1001|OUT|
|1010|JMP|
|1011|JZ|
|1100|JNZ|

## FPGA Synthesis Summary

- Slice : **23**
- Slice LUTs : **71**
- LUT as logic : **63**
- LUT as memory : **8**
- Slice Registers : **35**
- Bonded IOBs : **26**
- BUFGCTRL : **1**
- Worst Negative Slack (WNS) : **3.010 ns**
- Worst Hold Slack (WHS) : **0.143 ns**

## Tools Used

- Verilog HDL
- Icarus Verilog
- GTKWave
- Xilinx Vivado