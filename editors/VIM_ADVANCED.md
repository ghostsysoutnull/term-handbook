# Vim Guide: Advanced Techniques

Take your Vim skills to the next level with productivity-boosting commands and automation.

## 1. Advanced Navigation: Markers
Marks allow you to jump to specific locations across different files.

| Command | Description                                      |
| :------ | :----------------------------------------------- |
| `m<a-z>`| Set a local mark (current file) at cursor.       |
| `'<a-z>`| Jump to the line of local mark.                  |
| ``<a-z>`| Jump to the exact position of local mark.        |
| `m<A-Z>`| Set a global mark (visible across all files).    |
| `'<A-Z>`| Jump to the global mark (even if in another file).|
| `:marks`| List all current marks.                          |

## 2. Smart Navigation (Paths and Searching)
Vim can search your project recursively if configured correctly.

### The `path` and `:find`
Add `set path+=**` to your `.vimrc` to enable recursive searching.
- `:find <filename>`: Search for a file in your `path` and open it.
- `Tab` (after `:find`): Cycle through matching files.

### `gf` (Go to File)
Hover your cursor over a filename or path in any text and press `gf`. Vim will immediately attempt to open that file.

## 3. Automation: Macros
Record a sequence of commands and play them back instantly.

| Command | Description                                      |
| :------ | :----------------------------------------------- |
| `q<a-z>`| Start recording a macro into register `a-z`.     |
| `q`     | Stop recording the macro.                        |
| `@<a-z>`| Play back the macro in register `a-z`.           |
| `@@`    | Repeat the last played macro.                    |
| `<n>@a` | Execute the macro `a` exactly `n` times.         |

## 3. Visual Block Mode
Perfect for editing columns of text or adding prefixes to multiple lines.

- `Ctrl-v`: Enter **Visual Block** mode.
- Use `h/j/k/l` to select a rectangular area.
- `I` (Shift-i): Insert text at the start of the block (applies to all lines after hitting `Esc`).
- `A` (Shift-a): Append text at the end of the block.
- `d` or `x`: Delete the selected block.
- `c`: Change the selected block.

## 4. Advanced Text Manipulation
- `.` (Dot): Repeat the last change.
- `:%s/old/new/gc`: Search and replace throughout the file with confirmation.
- `gv`: Re-select the last visual selection.
- `ga`: Show the ASCII/Unicode value of the character under the cursor.
- `xp`: Swap two characters.
- `ddp`: Swap two lines.

## 5. Working with Buffers and Windows
- `:ls`: List all active buffers.
- `:b <n>`: Switch to buffer number `n`.
- `:bnext` / `:bprev`: Move through buffer list.
- `Ctrl-w o`: Close all windows except the current one ("Only").
- `Ctrl-w H/J/K/L`: Move the current window to a different side of the screen.

## 6. Registers
Vim stores deleted or copied text in registers.

## 7. Pro Tips & Gotchas
- **Macro Mistake:** If you mess up your macro, just hit `q` to stop and start over.
- **Visual Block Mode:** If you select a block and hit `I` to insert, remember to hit `Esc` to apply the change to all lines.
- **Marks:** Remember that local marks (`a-z`) only work in the current file, but global marks (`A-Z`) can jump across files.
- **Registers:** Use `:reg` to see what's in your registers if you've lost track.
- **Buffer Management:** If you have many buffers open, use `:bnext` and `:bprev` for quick switching.
- **Search & Replace:** Use `:%s/old/new/gc` to confirm each change, which is safer than a global replace.

---

## 🔗 See Also
- [Vim Basics](VIM_GUIDE.md): The essential foundation of Vim.
- [Neovim](NEOVIM_GUIDE.md): The modern evolution of Vim.
