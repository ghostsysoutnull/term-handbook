# Vim Guide: Essential Commands

A quick reference for common Vim operations, screen splitting, pane management, and essential settings.

## 1. Opening and Closing Files
- `vim <filename>`: Open Vim from terminal.
- `:e <filename>`: Open a file from within Vim.
- `:q`: Quit current window (fails if there are unsaved changes).
- `:q!`: Force quit, discarding changes.
- `:w`: Write (save) changes.
- `:wq` or `:x` or `ZZ`: Save and quit.

## 2. Splitting the Screen
- `:sp <filename>`: Horizontal split.
- `:vsp <filename>`: Vertical split.
- `Ctrl-w s`: Split current window horizontally.
- `Ctrl-w v`: Split current window vertically.
- `Ctrl-w h/j/k/l`: Move focus between splits (left/down/up/right).

## 3. Resizing Panes
- `:resize <n>`: Set height to `n` lines.
- `:vertical resize <n>`: Set width to `n` columns.
- `Ctrl-w +`: Increase height.
- `Ctrl-w -`: Decrease height.
- `Ctrl-w >`: Increase width.
- `Ctrl-w <`: Decrease width.
- `Ctrl-w =`: Make all splits equal size.

## 4. Essential Settings (`set` commands)
- `:set number` (or `:set nu`): Show line numbers.
- `:set relativenumber` (or `:set rnu`): Show relative line numbers.
- `:set incsearch` (or `:set is`): Highlight search results as you type.
- `:set hlsearch` (or `:set hls`): Persistently highlight all search matches.
- `:set ignorecase` (or `:set ic`): Ignore case when searching.
- `:set smartcase` (or `:set scs`): Case-sensitive search only if uppercase is used.
- `:set wrap` / `:set nowrap`: Toggle line wrapping.

## 5. Navigation and Searching
- `/pattern`: Search forward for `pattern`.
- `?pattern`: Search backward for `pattern`.
- `n`: Jump to the next search match.
- `N`: Jump to the previous search match.
- `:noh` (or `:nohlsearch`): Clear the current search highlight.

## 6. Editing
- `u`: Undo.
- `Ctrl-r`: Redo.
- `i`: Enter Insert mode at the cursor.
- `Esc`: Return to Normal mode.
