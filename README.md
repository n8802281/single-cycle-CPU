# single-cycle-CPU
A series of Verilog labs including ALU design, basic single-cycle CPU, and an extended CPU with memory, jump, and branch support.

---

## 🧪 ALU & Shifter

**Goal:**  
Design a 32-bit Arithmetic Logic Unit (ALU) and a shifter using purely combinational logic.

**Key Features:**
- ALU constructed from 32 chained 1-bit ALU modules
- Supported operations: add, sub, and, or, nand, nor, slt
- Output flags: `zero`, `overflow`
- Shifter supports 1-bit logical left and right shifts

📂 Folder: `alu_shifter/`

---

## 💻 Single-Cycle CPU (Basic)

**Goal:**  
Construct a basic MIPS-style single-cycle CPU capable of executing core arithmetic and logic instructions.

**Supported Instructions:**
- R-type: `add`, `sub`, `and`, `or`, `nor`, `slt`
- Shift: `sll`, `srl`
- I-type: `addi`

**Included Modules:**
- ALU, ALU Control, Decoder, Register File, Shifter, Program Counter, Instruction Memory, etc.

📂 Folder: `simple_cpu/`

---

## 🚀 Single-Cycle CPU (Extended)

**Goal:**  
Enhance the basic CPU to support memory access, branching, and various jump instructions.

**Additional Supported Instructions:**
- Memory: `lw`, `sw`
- Branch: `beq`, `bne`, `blt`, `bgez`, `bnez`
- Jump: `j`, `jal`, `jr`

**Notable Features:**
- PC control for conditional and jump logic
- Stack pointer initialization (Reg[29] = 128)
- Memory access with `Data_Memory.v`
- Extended ALUOp control logic (up to 3 bits)

📂 Folder: `full_cpu/`

---

## 🔧 Development Environment

- **Language:** Verilog HDL  
- **Simulator:** ModelSim Student Edition 10.4a  
- **Testing:** Provided `TestBench.v` and test data files

---

## 📌 Learning Highlights

Throughout this project, I learned how to:
- Build modular combinational logic from gate-level design
- Design and test complex CPU datapaths
- Manage control signal propagation through multi-module systems
- Support instruction decoding and PC manipulation for real instruction flow

This project was foundational in helping me understand how processors are built from the ground up.
