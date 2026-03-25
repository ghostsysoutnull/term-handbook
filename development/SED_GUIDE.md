# sed Guide: The Stream Editor

A quick reference for `sed`, the non-interactive text editor for filtering and transforming text in a pipeline.

## 1. Basic Structure
The most common usage of `sed` is for find-and-replace using the `s` (substitute) command.

```bash
sed 's/pattern/replacement/flags' input_file
```

| Component | Description                                      |
| :-------- | :----------------------------------------------- |
| **pattern** | The text (or regex) to find.                    |
| **replacement**| The text to put in its place.                 |
| **flags**   | Modify substitution (e.g., `g` for global).     |

## 2. Common Flags
| Flag | Description                                      |
| :--- | :----------------------------------------------- |
| `g`  | **Global**: Replace ALL occurrences in the line (not just the first). |
| `i`  | **In-place**: Modify the file directly (use with caution!). |
| `n`  | **Silent**: Suppress automatic printing of lines. |
| `p`  | **Print**: Print the current line (often used with `-n`).|

## 3. Practical Examples
| Task                      | Command                                           |
| :------------------------ | :------------------------------------------------ |
| **Replace first match**   | `sed 's/old/new/' file`                           |
| **Replace all matches**   | `sed 's/old/new/g' file`                          |
| **Delete empty lines**    | `sed '/^$/d' file`                                |
| **Print specific lines**  | `sed -n '5,10p' file` (Prints lines 5 through 10) |
| **Remove a string**       | `sed 's/pattern//g' file`                         |
| **Uppercase to lowercase**| `sed 's/[A-Z]/\L&/g' file` (GNU sed only)         |

## 4. Addressing (Where to apply)
You can restrict `sed` commands to specific lines or patterns.

- **By line number:** `sed '3s/old/new/' file` (Only replace on line 3).
- **By range:** `sed '1,5d' file` (Delete lines 1 through 5).
- **By pattern:** `sed '/ERROR/s/red/RED/g' file` (Only replace on lines containing "ERROR").

## 5. Multiple Commands
You can execute multiple `sed` actions in one pass using the `-e` flag or semicolons.

```bash
sed -e 's/old/new/g' -e 's/foo/bar/g' file
# OR
sed 's/old/new/g; s/foo/bar/g' file
```

## 6. Pro Tips & Gotchas
- **Dry Run:** Always test without the `-i` flag first to ensure your substitution is correct.
- **Backups:** When using `-i`, you can create a backup automatically: `sed -i.bak 's/old/new/g' file`.
- **Alternative Delimiters:** If you are editing paths, you don't have to use `/`. You can use any character: `sed 's|/usr/bin|/usr/local/bin|g'`.
- **Regex Flavor:** Like `grep`, `sed` uses Basic Regex (BRE) by default. Use `sed -E` for Extended Regex (ERE) to avoid escaping `+`, `?`, `|`, etc.

---

## 🔗 See Also
- [Regex Master](REGEX_GUIDE.md): The syntax used for `pattern`.
- [awk Guide](AWK_GUIDE.md): For logic-based text processing (if/else, math).
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master the pipes that flow into sed.
