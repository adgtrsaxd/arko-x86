## Getting Started

1. **Compile with debug symbols**  
   ```bash
   gcc -g -o myprog myprog.c
   ```  
   The `-g` flag embeds debugging information so GDB can map machine code back to source lines and variable names.

2. **Launch GDB**  
   ```bash
   gdb ./myprog
   ```  
   Starts a GDB session for `myprog`. You’ll see the `(gdb)` prompt.

## Breakpoints

### Setting Breakpoints

- **Simple breakpoint**  
  ```gdb
  (gdb) break main
  ```  
  Stops execution upon entering the `main` function.

- **Line-based breakpoint**  
  ```gdb
  (gdb) break myfile.c:42
  ```  
  Halts just before executing line 42 in `myfile.c`.

- **Conditional breakpoint**  
  ```gdb
  (gdb) break process_data if count > 100
  ```  
  Triggers only when `count > 100`.

### Managing Breakpoints

- **List all breakpoints**  
  ```gdb
  (gdb) info breakpoints
  ```  
  Shows number, location, condition, and hit count for each breakpoint.

- **Disable/enable**  
  ```gdb
  (gdb) disable 2
  (gdb) enable 2
  ```  
  Temporarily turn breakpoint #2 off or on.

- **Delete**  
  ```gdb
  (gdb) delete 2
  ```  
  Removes breakpoint #2 permanently.

## Running and Stepping

- **Run or restart**  
  ```gdb
  (gdb) run
  ```  
  Begins (or re-begins) execution until the next breakpoint or program end.

- **Continue**  
  ```gdb
  (gdb) continue
  ```  
  Resumes execution after a stop (breakpoint or step).

- **Next (n)**  
  ```gdb
  (gdb) next
  ```  
  Executes the next source line, without stepping into function calls.

- **Step (s)**  
  ```gdb
  (gdb) step
  ```  
  Steps into functions, stopping at the first instruction of the next source line.

## Inspecting Data

- **Print variable**  
  ```gdb
  (gdb) print myVar
  ```  
  Displays the current value of `myVar`.

- **Inspect registers**  
  ```gdb
  (gdb) info registers
  ```  
  Dumps all CPU register values at the stop point.

- **Display automatically**  
  ```gdb
  (gdb) display count
  ```  
  Shows `count` each time execution stops.

## Examining Memory

- **Examine (`x`)**  
  ```gdb
  (gdb) x/16xb buffer
  ```  
  Dumps 16 bytes of memory at address `buffer`, in hex.

- **Other formats**  
  - `/d` for decimal  
  - `/s` for C-strings  
  - `/i` for disassembly of instructions

## Watchpoints

- **Set a watchpoint**  
  ```gdb
  (gdb) watch total
  ```  
  Stops when variable `total` is written to.

## Getting Help

- **Help**  
  ```gdb
  (gdb) help
  (gdb) help break
  (gdb) apropos watch
  ```  
  Use `help` (or `h`) for an overview, `help <command>` for details, and `apropos <keyword>` to search command descriptions.

## Exiting

- **Quit GDB**  
  ```gdb
  (gdb) quit
  ```  
  Exits the debugger. You’ll be prompted to confirm if the program is still running.

