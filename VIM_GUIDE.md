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

## 7. Configuration
Vim is configured using the `.vimrc` file located in your home directory.

- **File Location:** `~/.vimrc`
- **Common Settings:**
  - `set number`: Always show line numbers.
  - `set tabstop=4`: Set tab width to 4 spaces.
  - `set expandtab`: Use spaces instead of actual tabs.
  - `syntax on`: Enable syntax highlighting.
  - `colorscheme desert`: Set a built-in color scheme.

## 8. Pro Tips & Gotchas
- **Accidental Recording:** If you see `recording @q` at the bottom, you hit `q` by mistake. Press `q` again to stop recording.
- **Stuck in a Mode:** If you're lost, hit `Esc` multiple times to return to Normal mode.
- **Search Highlighting:** If your screen is covered in highlights after a search, use `:noh` to clear them.
- **Relative Numbers:** Use `:set rnu` to see line distances, which makes jumping (e.g., `5j` for 5 lines down) much easier.
- **Case Sensitivity:** If searching feels unpredictable, `:set smartcase` will ignore case unless you type an uppercase letter.

---

## 🔗 See Also
- [Vim Advanced](VIM_ADVANCED.md): Macros, markers, and visual block mode.
- [Neovim](NEOVIM_GUIDE.md): Modern features and Lua-based configuration.
- [nano](NANO_GUIDE.md): For when you just need a quick, simple edit.
