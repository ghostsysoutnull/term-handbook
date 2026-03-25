# GNU nano Guide: Essential Commands

A quick reference for simple and efficient text editing with GNU nano.

## 1. Opening and Saving Files
- `nano <filename>`: Open nano from terminal.
- `Ctrl-o`: **Write Out** (Save the current file).
- `Ctrl-x`: **Exit** (Prompts to save if there are unsaved changes).

## 2. Basic Navigation
- `Ctrl-a`: Move to the **beginning** of the current line.
- `Ctrl-e`: Move to the **end** of the current line.
- `Ctrl-y` / `Alt-y`: Move **Page Up**.
- `Ctrl-v` / `Alt-v`: Move **Page Down**.
- `Ctrl-_`: Go to a specific **line number**.

## 3. Editing and Text Manipulation
- `Ctrl-k`: **Cut** the current line (stores it in the "cutbuffer").
- `Ctrl-u`: **Uncut** (Paste) the line from the cutbuffer.
- `Ctrl-t`: Execute a **spell check** (if installed).
- `Alt-a`: Start **Marking** (for selecting text). Use arrow keys to select.
- `Alt-6`: **Copy** the marked text to the cutbuffer.
- `Ctrl-k` (on marked text): **Cut** the marked text.

## 4. Searching and Replacing
- `Ctrl-w`: **Where Is** (Search forward for a string).
- `Alt-w`: **Repeat** the last search.
- `Ctrl-\`: **Replace** a string (search and replace).

## 6. Pro Tips & Gotchas
- **Accidental Exit:** If you hit `Ctrl-x` by mistake, nano will prompt you to save. Just hit `n` to discard or `Enter` to save and quit.
- **Copy and Paste:** Remember that nano uses its own cutbuffer (`Ctrl-k`, `Ctrl-u`), which is separate from your system clipboard.
- **Save and Continue:** Use `Ctrl-o` to save without exiting, which is a great way to "checkpoint" your work.
- **Quick Undo:** Use `Alt-u` for a quick undo, and `Alt-e` if you want to redo it.
- **Search Highlighting:** If you search with `Ctrl-w`, nano will highlight all matches. Use `Alt-w` to find the next one.

---

## 🔗 See Also
- [Vim Basics](VIM_GUIDE.md): For when you're ready to learn a more powerful editor.
