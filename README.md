# Single-Cycle MIPS Processor in Verilog

## Overview

This project implements a **32-bit Single-Cycle MIPS Processor** using **Verilog HDL** and is simulated using **Xilinx Vivado**. The processor executes each instruction in a single clock cycle and demonstrates the fundamental architecture and datapath of a MIPS processor.

The project was developed as part of my FPGA and Digital Design learning journey to strengthen my understanding of processor architecture, digital logic, and hardware description languages.

---

## Features

* 32-bit Single-Cycle MIPS Architecture
* Program Counter (PC)
* Instruction Memory
* Register File
* Arithmetic Logic Unit (ALU)
* Control Unit
* Sign Extension Unit
* Data Memory
* Multiplexers and Adders
* Branch Address Calculation
* Behavioral Simulation in Vivado

---

## Processor Datapath

The processor consists of the following major modules:

* Program Counter (PC)
* Instruction Memory
* Control Unit
* Register File
* ALU
* Data Memory
* Sign Extension
* ALU Control
* Multiplexers
* Branch Logic

---

## Tools Used

* Verilog HDL
* Xilinx Vivado
* Behavioral Simulation

---

## Repository Structure

```text
src/            Verilog source files
tb/             Testbench
images/         RTL schematic and simulation waveforms
README.md       Project documentation
LICENSE         MIT License
```

---

## Simulation

The processor was verified through behavioral simulation in Vivado using a custom testbench.

Simulation screenshots are available in the `images` folder.

---

## Learning Outcomes

Through this project, I gained practical experience with:

* MIPS Processor Architecture
* Datapath and Control Design
* Verilog HDL
* FPGA Design Flow
* Digital System Simulation
* Hardware Debugging

---

## Future Improvements

* Multi-Cycle MIPS Processor
* Five-Stage Pipelined MIPS Processor
* Hazard Detection Unit
* Forwarding Unit
* FPGA Hardware Implementation
* Instruction Set Expansion

---

## Author

**Hannah Ajish**

B.Tech – Electrical and Electronics Engineering (EEE)

Interested in FPGA Design, Digital Systems, VLSI, and Embedded Hardware Development.
