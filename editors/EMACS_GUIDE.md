# Emacs Guide: The Extendable Text Editor

A tiered reference for mastering Emacs, from basic navigation to advanced Elisp customization and Org-mode.

## Level 1: The Essentials (Getting Started)
Focus on survival: moving, saving, and quitting. In Emacs terminology, **C** stands for `Ctrl` and **M** stands for `Meta` (usually the `Alt` key).

| Command      | Action                                           |
| :----------- | :----------------------------------------------- |
| `C-x C-c`    | **Quit** Emacs.                                  |
| `C-x C-s`    | **Save** the current buffer.                     |
| `C-x C-f`    | **Find** (Open) a file.                          |
| `C-g`        | **Cancel** current command/prompt (The "Panic" key).|
| `C-p / C-n`  | Move cursor **Previous** (Up) / **Next** (Down). |
| `C-b / C-f`  | Move cursor **Backward** (Left) / **Forward** (Right).|
| `C-x b`      | Switch **Buffer**.                               |

## Level 2: Productivity (Managing the Environment)
Mastering windows, multiple files, and powerful search tools.

| Command      | Action                                           |
| :----------- | :----------------------------------------------- |
| `C-x 2`      | Split window **horizontally**.                  |
| `C-x 3`      | Split window **vertically**.                    |
| `C-x 0`      | Close the current window.                        |
| `C-x o`      | Switch focus to the **other** window.            |
| `C-s / C-r`  | **Search** forward / backward.                   |
| `M-%`        | **Query-replace** (Search and replace).          |
| `C-x d`      | Open **Dired** (The built-in file manager).      |
| `M-x <cmd>`  | Execute an Emacs command by name.                |

## Level 3: Power User (Org-mode & Elisp)
Customizing Emacs and using its most powerful "killer features."

### Org-mode: The Ultimate Organizer
Org-mode is a built-in tool for notes, TODO lists, and planning.
- `Tab`: Cycle visibility of a heading (Folder/Unfold).
- `C-c C-t`: Rotate a task's status (TODO -> DONE).
- `M-Left / M-Right`: Change heading level.

### Package Management
Emacs has a massive ecosystem of packages.
- `M-x package-install`: Install a new package.
- `M-x list-packages`: Browse the available repository.

## 4. Configuration
Emacs is configured via Emacs Lisp (Elisp).

- **File Location:** `~/.emacs` or `~/.emacs.d/init.el`
- **Recommended Settings:**
  ```elisp
  ;; Turn off unnecessary GUI elements
  (menu-bar-mode -1)
  (tool-bar-mode -1)
  (scroll-bar-mode -1)

  ;; Highlight current line
  (global-hl-line-mode 1)

  ;; Enable line numbers
  (global-display-line-numbers-mode 1)
  ```

## 5. Pro Tips & Gotchas
- **The "Meta" Key:** If `Alt` doesn't work, `Esc` followed by a key often acts as `Meta`.
- **C-g is Life:** If you get stuck in a weird prompt or Emacs seems frozen, spam `C-g` to reset.
- **Daemon Mode:** Start Emacs once with `emacs --daemon` and connect instantly with `emacsclient -c` for near-zero startup time.
- **Kill vs Delete:** In Emacs, "Killing" text means cutting/copying it to the "Kill Ring" (clipboard), while "Deleting" removes it without saving.

---

## 🔗 See Also
- [Vim Basics](VIM_GUIDE.md): Compare Emacs with the other giant of terminal editors.
- [Neovim](NEOVIM_GUIDE.md): Modern Vim features often inspired by Emacs' extensibility.
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master the shell you'll often run inside Emacs via `M-x shell`.
