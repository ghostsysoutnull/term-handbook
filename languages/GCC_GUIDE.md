# GCC Guide: The GNU Compiler Collection

A concise reference for compiling C and C++ programs using `gcc` and `g++`.

## 1. The Compilation Workflow
GCC follows a multi-stage process to transform source code into a machine-executable binary.

### 1.1 From Source to Binary
```text
[ Source .c ] --( Preprocessor )--> [ Expanded .i ]
      |                                     |
      +-------( Compiler )--------> [ Assembly .s ]
                                            |
      +-------( Assembler )-------> [ Object .o ]
                                            |
      +-------( Linker )----------> [ Executable ]
```

## 2. Basic Commands
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `gcc main.c`           | Compile `main.c` to default `a.out`.             |
| `gcc -o app main.c`    | Compile and name the output binary `app`.        |
| `gcc -Wall main.c`     | Enable all common warning messages (recommended).|
| `gcc -g main.c`        | Include debugging symbols for `gdb`.             |
| `gcc -c main.c`        | Compile to object file (`main.o`) without linking.|

## 3. Optimization Levels
| Flag  | Description                                            |
| :---- | :----------------------------------------------------- |
| `-O0` | No optimization (default). Best for debugging.         |
| `-O1` | Basic optimization without significant compile time.   |
| `-O2` | Recommended for production. Balanced speed/size.       |
| `-O3` | Aggressive optimization. May increase binary size.     |
| `-Os` | Optimize for binary size. Useful for embedded systems. |

## 4. Configuration
GCC behavior is influenced by environment variables and system search paths.

- **Environment Variables:**
  - `CC`: Set the default C compiler (e.g., `export CC=gcc`).
  - `CFLAGS`: Default flags for C compilation.
  - `LDFLAGS`: Default flags for the linker (e.g., library paths).
  - `C_INCLUDE_PATH`: Additional directories to search for header files.
- **Search Paths:**
  - Headers: `/usr/include`, `/usr/local/include`.
  - Libraries: `/usr/lib`, `/lib`.

## 5. Pro Tips & Gotchas
- **Static vs Dynamic Linking:** Use `-static` to bundle libraries into the binary, making it portable but much larger.
- **Header Locations:** Use `-I/path/to/headers` to include headers from non-standard locations.
- **Library Linking:** Use `-L/path/to/libs` to specify a library directory and `-l<name>` to link a specific library (e.g., `-lm` for the math library).
- **The Order Matters:** Always put your source files *before* the libraries they depend on in the command line.
- **Standard Selection:** Use `-std=c11` or `-std=c++17` to specify which language standard to enforce.

---

## 🔗 See Also
- [Makefile Guide](../development/MAKEFILE_GUIDE.md): Automate complex GCC build commands.
- [Shell Basics](../terminal/SHELL_GUIDE.md): Navigate the filesystem where your binaries live.
- [Regex Master](../terminal/REGEX_GUIDE.md): Use regex to filter compiler warnings or search through symbols.
