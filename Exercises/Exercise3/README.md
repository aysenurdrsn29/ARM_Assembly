# ARM Cortex-A9: Bare-Metal I/O and Peripheral Interfacing

This repository focuses on bare-metal input/output (I/O) operations and direct hardware manipulation using the ARM Cortex-A9 processor. The implementations demonstrate how to handle external peripherals, manage memory-mapped registers, and utilize efficient assembly algorithms without relying on an operating system.

## Implementations Included

### Task 1: Seven-Segment Display and Subroutines
* Converts raw binary/hexadecimal values into decimal format using a highly efficient, loop-based modulo-10 division algorithm (repeated subtraction).
* Utilizes a lookup table (`SEVEN_SEG_TABLE`) to decode integers (0-9) into precise 7-segment hardware activation signals.
* Combines the byte-sized display codes using inline logical shifts (`LSL`) and bitwise OR (`ORR`) to project a full 4-digit number onto a parallel port interface.

### Task 2: Polled I/O and Edge Capture (Pushbuttons)
* Implements continuous hardware polling to monitor external pushbutton inputs (KEY0 - KEY3).
* Safely interacts with the hardware's `EdgeCapture` register, ensuring correct interrupt/flag acknowledgement protocols to prevent infinite trigger loops.
* **Control Logic:** * `KEY0`: Sets the display to a static value (5).
  * `KEY1`: Increments the value by 1 (with wrap-around to 0 after 9).
  * `KEY2`: Decrements the value by 1 (with wrap-around to 9 after 0).
  * `KEY3`: Clears the display completely.

### Task 3: Integrated Hardware Control (Switches and Memory Arrays)
* Combines slide switches and pushbuttons to fetch and display structured data from a memory array (`PRICE_LIST`).
* Demonstrates advanced ARM architectural features by using inline barrel shifters (`LSL #2`) to dynamically multiply the 4-bit switch index, efficiently calculating the exact 32-bit word memory offset in a single instruction.
* Reuses the modular context-saving subroutines (`PUSH`/`POP`) from Task 1 to seamlessly decode and display the fetched array values.

## Architecture and setup
These scripts manipulate memory-mapped I/O registers located at standard DE1-SoC offsets (`0xFF200020` for displays, `0xFF200040` for switches, `0xFF200050` for keys). They can be compiled and executed on any compatible ARMv7 development board or the CPUlator simulator.