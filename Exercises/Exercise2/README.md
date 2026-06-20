# ARM Cortex-A9 Assembly: Bit-Level Logic and Data Manipulation

This repository contains ARMv7 assembly implementations focusing on logic instructions, which are essential for manipulating bit strings and handling data at the bit level.

## Implementations Included

### Task 1: Longest Consecutive 1-Chain
* Evaluates a word of data to determine the length of the longest string of consecutive `1`s.
* Utilizes a highly efficient algorithm combining logical shift (`LSR`) and `AND` operations to dynamically count overlapping bit sequences.

### Task 2: Longest Consecutive 0-Chain
* Determines the length of the longest string of consecutive `0`s in a binary number.
* Achieves this by utilizing the `MVN` instruction to transform the data, effectively converting sequences of `0`s into `1`s before processing the chain length . 
* The final result is explicitly stored in register `R7`.

### Task 3: Parity Bit Calculation
* Implements a parity generator to determine both even and odd parity bits for a given binary sequence.
* Employs cascaded `EOR` (Exclusive OR) instructions and logical shifts to reduce the 32-bit word into a single parity status.
* The system elegantly packs the results: the even parity bit goes into the Least Significant Bit (LSB) of register `R8`, while the odd parity bit is shifted into the Most Significant Bit (MSB) of register `R8`.

## Execution
* These assembly routines are optimized for the ARM Cortex-A9 architecture and can be executed natively on compatible development boards or emulators without requiring external hardware dependencies.