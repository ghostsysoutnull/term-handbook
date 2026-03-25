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

## 5. Other Useful Features
- `Ctrl-g`: **Get Help** (Displays a list of all commands).
- `Ctrl-c`: Show the **current cursor position** (line, column, character).
- `Ctrl-j`: **Justify** (Wrap) the current paragraph.
- `Alt-u`: **Undo** the last action.
- `Alt-e`: **Redo** the last action.
