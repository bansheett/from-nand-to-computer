Nand to Tetris: Building a Modern Computer from First Principles

This repository contains my solutions for the hardware hierarchy of the Nand to Tetris (Part I) course. The project follows a bottom-up approach, starting from a single fundamental logic gate (Nand) and progressively building a fully functional 16-bit computer capable of executing machine language programs.

The goal of this project was to bridge the gap between theoretical computer science and physical hardware architecture. By implementing each chip in HDL (Hardware Description Language), I gained a deep understanding of how data flows through a CPU and how complex operations are broken down into electrical signals.


    Elementary Logic Gates: Implemented basic building blocks such as And, Or, Xor, and Mux.

    Combinational Logic: Designed a 16-bit Arithmetic Logic Unit (ALU) capable of performing arithmetic and bitwise operations.

    Sequential Logic: Built memory systems, starting from a 1-bit Flip-Flop to Registers, RAM (up to 16K), and a Program Counter (PC).

    Computer Architecture: Integrated all components into a central CPU and a top-level Hack Computer capable of interacting with a screen and keyboard.

Repository Structure

    01/: Boolean Logic (Basic Gates)

    02/: Boolean Arithmetic (ALU and Adders)

    03/: Memory (Registers and RAM)

    04/: Machine Language (Assembly Programming)

    05/: Computer Architecture (The Hack CPU and Computer)

Tech Stack

    Language: HDL (Hardware Description Language)

    Tools: Nand2Tetris Hardware Simulator
