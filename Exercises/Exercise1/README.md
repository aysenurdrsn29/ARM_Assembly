# ARM Cortex-A9 Assembly: Memory Addressing & Data Manipulation Exercises

This repository contains my independent study and implementations of low-level ARMv7 assembly codes. The focus is on understanding hardware-level memory management, exploring various addressing modes, and performing precise data manipulation on the Cortex-A9 architecture.

## Implementations Included

*   **Memory Addressing Modes:** A comprehensive breakdown of different ARM memory addressing techniques by sequentially storing register values into memory. The code covers:
    *   Register Indirect Addressing.
    *   Pre-indexed Addressing.
    *   Pre-indexed Addressing with write-back (`!`).
    *   Post-indexed Addressing.
*   **Advanced Memory Operations:** Combines multiple addressing modes (pre-indexed, post-indexed, and write-back) to efficiently load, manipulate, and store data across memory locations.
*   **Byte-Level Processing:** Demonstrates precise memory access using `LDRB` and `STRB` instructions to read and overwrite specific bytes within a stored word (e.g., handling the `0x12AB` hexadecimal value).

## Compilation & Setup

These scripts are written for the ARMv7 architecture and can be executed on Cortex-A9 development boards or compatible emulators. 

**Important:** Each assembly file utilizes the `.include "address_map_arm.s"` directive to define hardware base addresses. Ensure that the `address_map_arm.s` file is present in your root directory alongside the assembly scripts before compiling.