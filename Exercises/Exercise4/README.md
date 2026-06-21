# Hardware Timers, Polled I/O and The Knight Rider 

### 1. The "Hard Way" to Blink an LED (Hardware Timers)
* **The Goal:** Simply toggle the green LED (LEDG), but do it with absolute precision.
* **How it works:** Instead of using an arbitrary, CPU-blocking delay loop, this script configures the **MPCore Private Timer**. It continuously polls the timer's status flag, acknowledges the timeout, and uses a bitwise XOR (`EOR`) to cleanly flip the LED state.

### 2. Pushbuttons and Polled I/O (`EdgeCapture`)
* **The Goal:** Toggle the LED manually using a physical pushbutton.
* **How it works:** This implements a continuous polling loop checking the `EdgeCapture` register of the board's keys. It demonstrates proper hardware etiquette: detecting the button press, acknowledging the hardware flag (so the system doesn't get stuck in an infinite trigger loop), and safely applying the toggle.

### 3. The Knight Rider Effect (Dynamic Display Patterns)
This was the most fun part of the project. I wrote an algorithm to recreate the classic bouncing "Knight Rider" light scanner across the 7-segment displays using bit-shifting. I've included two versions to show the logic progression:

* **Version 1:** Gets the logic working on the first four displays (`HEX3-HEX0`). It introduces a dynamic direction flag (0 for left, 1 for right) and uses logical shifts (`LSL`, `LSR`) to bounce a single active segment back and forth.
* **Version 2 (The Complete System):** Expands the animation across all six displays (`HEX5-HEX0`). Because `HEX5-4` and `HEX3-0` are controlled by two entirely different memory addresses, a simple continuous bit-shift isn't enough. I engineered custom boundary-checking logic to seamlessly "jump" the active light across the memory gap while maintaining a smooth bouncing animation.

## Tech Stack and Architecture
* **Language:** ARMv7 Assembly
* **Target Hardware:** ARM Cortex-A9 / Altera DE1-SoC
* **Key Concepts:** Memory-Mapped I/O, MPCore Timers, Edge Capturing, Inline Barrel Shifting (`LSL`/`LSR`), State Machines, and Boundary Logic.

---
*Note: If you are running these scripts, ensure your `address_map_arm.s` definitions are loaded into your environment's root directory.*