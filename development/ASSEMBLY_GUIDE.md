# Linux Assembly Guide: x86_64 Programming

A comprehensive reference for low-level programming on Linux using the x86_64 architecture.

## 1. The x86_64 Register Map
Registers are high-speed storage locations within the CPU. Understanding their roles is fundamental.

| Register | Purpose                                      | Caller/Callee Save |
| :------- | :------------------------------------------- | :----------------- |
| `rax`    | Return value / System call number            | Caller             |
| `rbx`    | Base register                                | Callee             |
| `rcx`    | 4th argument to functions                    | Caller             |
| `rdx`    | 3rd argument to functions                    | Caller             |
| `rsi`    | 2nd argument to functions                    | Caller             |
| `rdi`    | 1st argument to functions                    | Caller             |
| `rbp`    | Base pointer (start of stack frame)          | Callee             |
| `rsp`    | Stack pointer (current top of stack)         | Callee             |
| `r8-r11` | Temporary registers / 5th-6th arguments      | Caller             |
| `r12-r15`| General purpose registers                    | Callee             |

### 1.1 Register Sizes
- `rax`: 64-bit
- `eax`: 32-bit (lower 32 bits of `rax`)
- `ax`: 16-bit (lower 16 bits of `eax`)
- `al` / `ah`: 8-bit (lower/higher byte of `ax`)

## 2. Common Instructions
| Mnemonic | Description                                | Example                    |
| :------- | :----------------------------------------- | :------------------------- |
| `mov`    | Move data from source to destination       | `mov rax, 60`              |
| `add`    | Add source to destination                  | `add rdi, 5`               |
| `sub`    | Subtract source from destination           | `sub rdx, 1`               |
| `inc`    | Increment by 1                             | `inc rcx`                  |
| `dec`    | Decrement by 1                             | `dec rsi`                  |
| `cmp`    | Compare two values (sets flags)            | `cmp rax, 0`               |
| `jmp`    | Unconditional jump to a label              | `jmp .loop`                |
| `je`     | Jump if equal                              | `je .error`                |
| `jne`    | Jump if not equal                          | `jne .process`             |
| `call`   | Call a procedure (pushes return address)   | `call my_function`         |
| `ret`    | Return from procedure (pops return address)| `ret`                      |
| `syscall`| Execute a system call                      | `syscall`                  |

## 3. The Linux System Call Convention
To interact with the OS (I/O, process management), use the `syscall` instruction.

### 3.1 Syscall Register Mapping
1. `rax`: System call number (e.g., 1 for `write`, 60 for `exit`).
2. `rdi`: 1st Argument.
3. `rsi`: 2nd Argument.
4. `rdx`: 3rd Argument.
5. `r10`: 4th Argument.
6. `r8`: 5th Argument.
7. `r9`: 6th Argument.

### 3.2 Visualizing the Stack
The stack grows **downward** in memory.
```text
High Memory
+-----------------------+
| Return Address        | <-- RSP (before call)
+-----------------------+
| Previous RBP          |
+-----------------------+
| Local Variables       |
| ...                   |
+-----------------------+
| Saved Registers       |
+-----------------------+
| ...                   | <-- RSP (current)
Low Memory
```

## 4. Hello World (NASM Syntax)
Create a file named `hello.asm`:

```nasm
section .data
    msg db "Hello, Linux Assembly!", 10 ; 10 is the newline character
    len equ $ - msg                   ; calculate length of msg

section .text
    global _start

_start:
    ; syscall: write(1, msg, len)
    mov rax, 1          ; syscall number for sys_write
    mov rdi, 1          ; file descriptor 1 is stdout
    mov rsi, msg        ; pointer to the message
    mov rdx, len        ; message length
    syscall             ; invoke the kernel

    ; syscall: exit(0)
    mov rax, 60         ; syscall number for sys_exit
    mov rdi, 0          ; exit code 0
    syscall             ; invoke the kernel
```

### 4.1 Compiling and Linking
Use `nasm` to assemble and `ld` to link the object file.

```bash
# 1. Assemble (creates hello.o)
nasm -f elf64 hello.asm

# 2. Link (creates the executable 'hello')
ld -s -o hello hello.o

# 3. Run
./hello
```

## 5. Debugging with GDB
Assembly is unforgiving. GDB is your best friend.

- **Start GDB:** `gdb ./hello`
- **Break at entry:** `break _start`
- **Run:** `run`
- **Step Instruction:** `stepi` (or `si`)
- **View Registers:** `info registers` (or `i r`)
- **Examine Memory:** `x/16xb $rsp` (hex dump of 16 bytes at stack pointer)
- **Disassemble:** `disassemble _start`

## 6. Configuration
- **Assemblers:**
  - `nasm`: Netwide Assembler (Intel syntax).
  - `as`: GNU Assembler (AT&T syntax by default).
  - `yasm`: A rewrite of NASM.
- **Linkers:**
  - `ld`: The standard GNU linker.
  - `gold`: A faster ELF-only linker.

## 7. Pro Tips & Gotchas
- **Intel vs. AT&T Syntax:** `mov rax, rbx` (Intel: dst, src) vs. `movq %rbx, %rax` (AT&T: src, dst). This guide uses Intel/NASM syntax.
- **Zeroing Registers:** `xor rax, rax` is faster and smaller than `mov rax, 0`.
- **Memory Addressing:** Use `[label]` to access the value at a memory location. `mov rax, label` moves the *address* of the label into `rax`.
- **Alignment:** Ensure the stack is 16-byte aligned before calling C functions (like `printf`).
- **Segment Faults:** Usually caused by accessing restricted memory or stack corruption. Always check your `rsp` and `rbp` management.

---

## 🔗 See Also
- [GCC Guide](GCC_GUIDE.md): Using GCC to compile and link C with Assembly.
- [Compilation Stages](COMPILATION_STAGES_GUIDE.md): Understanding how assembly fits into the build pipeline.
- [Makefile Guide](MAKEFILE_GUIDE.md): Automate the assembly/linking process.
- [GDB Ref (Coming Soon)](#): Comprehensive debugger commands.
