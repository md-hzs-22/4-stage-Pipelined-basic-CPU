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

So, the main idea of pipelining is that the five subparts are performed in CPU in such way that if instruction 1 completes its fetching part, instruction 2 enters for fetching and instruction 1 goes on for decoding part. The pipelining is efficient as it saves a lot of time. Assume that each and every subpart of the instruction takes a single clock cycle to perform and lets assume there are x instructions. So without pipelining, computer takes 5x clock cycles to compute but with pipeling, it only takes x+4 clock cycles. The folloing picture will help you understand ore on the topic.

![Bad request](https://qph.cf2.quoracdn.net/main-qimg-98acc2db73e312c886ac95909a692b23-lq)

As we can see in aboove image at t3, instruction 3 is at fetching, instruction 2 at decoding and instruction 1 at executing phase simultaneously.

## Objective

The main objective of my project is to take the idea of pipelining and implement the CPU by writing the codes of each and every section of CPU such as ALU, control unit, register file, instruction memory ,etc and to join them together so as to work as a functioning pipelined CPU. Following is the image of pipelined CPU. 

![Bad request](https://github.com/md-hzs-22/4-stage-Pipelined-basic-CPU/blob/main/Screenshots/Screenshot%202024-06-26%20163857.png)

## Technical Stack

- Language used : Verilog
- Software on which this will work - Xilinx Vivado

## How to run

In order to run the CPU, you need to download each and every file in the single folder. After that, create a new project on Vivado software and add each and every file to the project. Select Zedboard for the project. 
* If you want to see the working and final result of the test instruction set (instructions are in the file named imem_test().txt), set testbench file as top priority and simulate the file
* If you want to implement the given CPU on boards like zedboard, then make pipelined_4stage.v as top file and run implementaion.

`Note : ` ALU is written to handle simple instructions, that are, ADD, SUB, AND, XOR, COM, MUL, ADDI. So if you want to add a new insruction for testing in imem_test().txt, take care of this situation.

`Note : ` Do not change any name of the file 'and' do not add instruction other than mentioned.

## Usage

Most widely used architecture in modern CPU.

