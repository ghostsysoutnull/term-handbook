# Power User Toolkit: Essential Modern CLI Tools

A quick reference for high-performance terminal utilities that significantly boost productivity.

## 1. ripgrep (`rg`) - Fast Search
A line-oriented search tool that recursively searches your current directory for a regex pattern.

| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `rg "pattern"`         | Search for a pattern in the current directory.   |
| `rg -i "pattern"`      | Case-insensitive search.                         |
| `rg -w "pattern"`      | Search for whole words only.                     |
| `rg -t py "pattern"`   | Search only within Python files.                 |
| `rg --files-with-matches "pattern"`| List only filenames containing matches.|

## 2. fzf - Fuzzy Finder
An interactive Unix filter for command-line that can be used with any list (files, history, processes).

| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `fzf`                  | Interactively search and select a file.          |
| `Ctrl-r`               | (When shell-integrated) Fuzzy search history.     |
| `Ctrl-t`               | Fuzzy search files and paste to command line.    |
| `kill -9 <TAB>`        | Fuzzy search and select a process to kill.       |

## 3. fd - Fast Find
A simple, fast, and user-friendly alternative to the `find` command.

| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `fd "pattern"`         | Find files matching a specific pattern.          |
| `fd -e jpg`            | Find all files with a `.jpg` extension.          |
| `fd -x <cmd>`          | Execute a command for every result found.        |
| `fd --hidden`          | Include hidden files in the search results.      |

## 4. jq - JSON Processor
A lightweight and flexible command-line JSON processor.

| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `cat data.json | jq .` | Pretty-print a JSON file.                        |
| `jq '.name' file.json` | Extract the value of the "name" field.           |
| `jq '.[0]' file.json`  | Get the first item in a JSON array.              |
| `jq '.[].id' file.json`| List all "id" values in an array of objects.     |

## 5. Configuration
Most of these tools work great out of the box, but can be customized via environment variables or config files.

- **ripgrep:** Use `~/.ripgreprc`.
- **fzf:** Set `FZF_DEFAULT_COMMAND` and `FZF_DEFAULT_OPTS` in your `.bashrc` or `.zshrc`.
- **fd:** Honors `.gitignore` by default. Use a `.fdignore` for custom exclusions.

## 6. Pro Tips & Gotchas
- **Shell Integration:** To get the most out of `fzf`, you MUST enable its shell bindings in your `.bashrc` or `.zshrc`.
- **ripgrep speed:** ripgrep is faster than `grep` because it respects your `.gitignore` by default.
- **jq filtering:** `jq` is a complete programming language. For complex queries, use single quotes `'` to avoid shell expansion.
- **fd vs find:** `fd` is much faster and has better defaults (like case-insensitivity by default), but `find` is more portable (available on every Unix).

---

## 🔗 See Also
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master the pipes and redirections these tools use.
- [Vim Advanced](../editors/VIM_ADVANCED.md): Many of these tools (like `fzf` and `rg`) have excellent Vim plugins.
