# 4-stage-Pipelined-basic-CPU

## Overview of the project
Initially the computers were performing or processing a single task at once, or we can say a single instruction at once. But for a lot number of instructions, it was time consuming. Hence the idea of pipelining came into being.

#### What is pipelining ??

There are total 5 essential subtasks that a computer performs (in order) while executing instructions.

1. Fetching the instruction from instruction memory
2. Decoding the instruction.
3. Executing it in ALU 
4. Write the result in computer memory (if required)
5. Write the result in the register (if required)

So, the main idea of pipelining is that the five subparts are performed in CPU in such way that if instruction 1 completes its fetching part, instruction 2 enters for fetching and instruction 1 goes on for decoding part. The pipelining is efficient as it saves a lot of time. Assume that each and every subpart of the instruction takes a single clock cycle to perform and lets assume there are x instructions. So without pipelining, computer takes 5x clock cycles to compute but with pipeling, it only takes x+4 clock cycles. The folloing picture will hel you understand about pipelining.

![Bad request](https://qph.cf2.quoracdn.net/main-qimg-98acc2db73e312c886ac95909a692b23-lq)

As we can see in aboove image at t3, instruction 3 is at fetching, instruction 2 at decoding and instruction 1 at executing phase simultaneously.

So, taking the idea of pipelining, I implemented the CPU by writing the codes of each and every section such as ALU, control unit, register file, instruction memory ,etc and joined them together to work as a functioning pipelined CPU. Following is the image of pipelined CPU. 

![Bad request](https://github.com/md-hzs-22/4-stage-Pipelined-basic-CPU/blob/main/Screenshot%202024-06-26%20163857.png)

`Note that ALU is written to handle simple instructions, that are, ADD, SUB, AND, XOR, COM, MUL, ADDI. So if you want to add a new insruction for testing in imem_test().txt, take care of this situation.`

## Technical Stack

- Language used : Verilog
- Software on which this will work - Xilinx Vivado

## How to run

In order to run the CPU, you need to download each and every file in the single folder. After that, create a new project on Vivado software and add each and every file to the project. Select Zedboard for the project. After you created the project set testbench file as the top priority file and run simulation for seeing the result. And if you want to implement on boards like zedboard, make pipelined_4stage.v as top priority. 

## Usage

