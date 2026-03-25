# Advanced Compilation: From Source to ELF Binary

A deep dive into the GNU/Clang compilation pipeline, focusing on symbol resolution, memory sections, and dynamic linking.

## 1. The Pipeline Overview
Compilation is a sequence of increasingly specialized transformations that lower the abstraction level of your code.

```text
[ Source .c ] --( Preprocessor )--> [ Expanded .i ]
      |                                     |
      +-------( Compiler )--------> [ Assembly .s ]
                                            |
      +-------( Assembler )-------> [ Object .o ]
                                            |
      +-------( Linker )----------> [ ELF Executable ]
```

## 2. Stage-by-Stage Breakdown with Examples

### 2.1 Preprocessing: The Text Substitution Stage
**Command:** `gcc -E main.c -o main.i`

The preprocessor performs literal text substitution. It doesn't understand C syntax; it only understands `#` directives.

- **Example:**
  ```c
  #define MAX 100
  #include <stdio.h>
  int val = MAX;
  ```
- **Result (`main.i`):**
  - Thousands of lines from `stdio.h` are pasted at the top.
  - `val = MAX;` becomes `val = 100;`.
- **Pro Tip:** Use `-dM` with `-E` to dump all defined macros in your environment: `gcc -dM -E - < /dev/null`.

### 2.2 Compilation: High-Level to Assembly
**Command:** `gcc -S -O2 main.i -o main.s`

The compiler translates C into architecture-specific Assembly. This is where **Optimization** happens.

- **Key Event: Name Mangling (C++ only):** In C++, `void func(int)` becomes `_Z4funci` so the linker can differentiate overloaded functions. C uses simple underscores (e.g., `_func`).
- **Inspection:** Open `main.s` to see how your C logic maps to `mov`, `push`, and `jmp` instructions.

### 2.3 Assembly: Instructions to Machine Code
**Command:** `gcc -c main.s -o main.o`

The assembler creates an **Object File**. This is binary machine code, but it is "relocatable"—it doesn't know its final memory address yet.

- **Relocation Table:** If `main.c` calls `calculate()`, the assembler leaves a "hole" in the `.o` file and adds an entry to the relocation table saying: "Hey Linker, fill this hole once you find where `calculate` lives."

### 2.4 Linking: The Final Resolution
**Command:** `gcc main.o utils.o -o my_app`

The linker merges all `.o` files and resolves external symbols.

- **Strong vs. Weak Symbols:** If you define the same global variable in two files, the linker will error (Duplicate Symbol). If one is marked `__attribute__((weak))`, the other takes precedence.
- **Static vs. Dynamic:**
  - **Static (`.a`):** Copies library code into your binary. No external dependencies at runtime.
  - **Dynamic (`.so`):** Records a dependency. The OS loader (`ld.so`) maps the library into memory when the app starts.

## 3. Binary Anatomy (ELF Sections)
A standard Linux binary (ELF - Executable and Linkable Format) is divided into sections:

| Section   | Content                                           | Permissions |
| :-------- | :------------------------------------------------ | :---------- |
| `.text`   | Compiled machine code (your instructions).        | Read/Exec   |
| `.rodata` | Read-only constants (like string literals).       | Read Only   |
| `.data`   | Initialized global and static variables.          | Read/Write  |
| `.bss`    | Uninitialized globals (zero-filled at startup).   | Read/Write  |

## 4. The Developer's Toolbox
Use these tools to debug compilation and linking issues.

| Tool      | Command Example            | Purpose                                      |
| :-------- | :------------------------- | :------------------------------------------- |
| `nm`      | `nm -C main.o`             | List symbols (T=Code, U=Undefined, D=Data).  |
| `objdump` | `objdump -d app`           | Disassemble a binary back to Assembly.       |
| `readelf` | `readelf -h app`           | View ELF header (architecture, entry point). |
| `ldd`     | `ldd app`                  | List shared library dependencies.            |
| `size`    | `size app`                 | Show sizes of `.text`, `.data`, and `.bss`.  |

## 5. Configuration & Shared Libraries
Managing shared objects (`.so`) requires specific flags and environment settings.

- **`fPIC` (Position Independent Code):** Required when building libraries: `gcc -fPIC -shared lib.c -o libtest.so`.
- **`RPATH`:** Hardcodes a library search path into the binary: `gcc -Wl,-rpath,/opt/mylib main.o -o app`.
- **`LD_LIBRARY_PATH`:** Overrides library search at runtime (use for testing only).

## 6. Pro Tips & Gotchas
- **ODR Violation (One Definition Rule):** In C++, defining the same class in two different headers with different members will cause silent, catastrophic memory corruption.
- **Visibility:** Use `__attribute__((visibility("hidden")))` to keep symbols inside your library and reduce the size of the dynamic symbol table.
- **Strip Binaries:** Use `strip app` to remove debugging symbols and shrink binary size for production.

---

## 🔗 See Also
- [GCC Guide](GCC_GUIDE.md): Basic command-line flags.
- [Makefile Guide](MAKEFILE_GUIDE.md): Automating multi-stage builds.
- [SysAdmin Guide](../terminal/SYSADMIN_GUIDE.md): Managing system-wide libraries and `ldconfig`.
