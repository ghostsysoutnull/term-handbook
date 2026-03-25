# Deep Dive: The 4 Stages of Compilation

A detailed guide explaining how source code is transformed into a binary executable, using the GCC/Clang workflow as a model.

## 1. The Big Picture
The compilation process is not a single step but a pipeline of four distinct transformations.

### 1.1 Compilation Pipeline Diagram
```text
[ Source .c ] --( Preprocessor )--> [ Expanded .i ]
      |                                     |
      +-------( Compiler )--------> [ Assembly .s ]
                                            |
      +-------( Assembler )-------> [ Object .o ]
                                            |
      +-------( Linker )----------> [ Executable ]
```

## 2. Stage-by-Stage Breakdown

### 2.1 The Preprocessor (`gcc -E`)
The preprocessor handles "meta" instructions that start with `#`.
- **Inclusion:** Replaces `#include` directives with the actual content of the header files.
- **Macro Expansion:** Replaces `#define` constants and macros throughout the code.
- **Comment Removal:** Strips all comments from the code.
- **Output:** A massive `.i` file containing pure C code.

### 2.2 The Compiler (`gcc -S`)
The compiler takes the expanded code and translates it into a lower-level language.
- **Analysis:** Performs syntax and semantic checks.
- **Optimization:** Rearranges code for better performance (based on `-O` flags).
- **Translation:** Converts C code into **Assembly Language** specific to the target architecture (e.g., x86_64).
- **Output:** An assembly source file ending in `.s`.

### 2.3 The Assembler (`gcc -c`)
The assembler converts the human-readable assembly instructions into machine code.
- **Encoding:** Translates mnemonics (like `mov`, `push`) into binary opcodes.
- **Object Files:** Creates "Object Files" which contain machine code but are not yet executable because they lack external addresses.
- **Output:** A binary object file ending in `.o`.

### 2.4 The Linker (Final Step)
The linker is the "glue" that combines everything into a final program.
- **Symbol Resolution:** Connects function calls (like `printf`) to their definitions in external libraries (like `libc`).
- **Memory Layout:** Determines the final memory addresses for all code and data sections.
- **Merging:** Combines multiple `.o` files and static libraries into one file.
- **Output:** The final **Executable** (e.g., `a.out` or `app`).

## 3. Practical Experiment
You can witness these stages yourself by running these commands on a simple `hello.c`:

| Stage        | Command                | Resulting File       |
| :----------- | :--------------------- | :------------------- |
| Preprocess   | `gcc -E hello.c -o hello.i` | View with `less`     |
| Compile      | `gcc -S hello.i -o hello.s` | Human-readable ASM   |
| Assemble     | `gcc -c hello.s -o hello.o` | Binary machine code  |
| Link         | `gcc hello.o -o hello`      | Run with `./hello`   |

## 4. Configuration
While not a "config file" in the traditional sense, these environment variables control the pipeline:
- `CPATH`: Extra directories for the **Preprocessor** to find headers.
- `LIBRARY_PATH`: Extra directories for the **Linker** to find static libraries.
- `LD_LIBRARY_PATH`: Extra directories for the **OS** to find shared libraries at runtime.

## 5. Pro Tips & Gotchas
- **Debugging the Preprocessor:** If a macro is behaving strangely, use `gcc -E` to see exactly what the code looks like after expansion.
- **Missing Symbols:** If you get a "Undefined reference to..." error, the **Linker** is failing. You likely forgot a `-l<lib>` flag.
- **Optimization vs Debugging:** Heavy optimization (`-O3`) can drastically change the assembly, making it nearly impossible to map back to source code during debugging.

---

## 🔗 See Also
- [GCC Guide](GCC_GUIDE.md): Practical command reference for daily use.
- [Makefile Guide](MAKEFILE_GUIDE.md): Automate these stages for multi-file projects.
- [Regex Master](REGEX_GUIDE.md): Search for specific opcodes in `.s` files.
