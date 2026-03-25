# awk Guide: Pattern Scanning and Processing

A quick reference for `awk`, the powerful text-processing language for data extraction and reporting.

## 1. Basic Structure
Awk works by reading a file line by line and performing actions on lines that match a specific pattern.

```bash
awk 'pattern { action }' input_file
```

| Component | Description                                      |
| :-------- | :----------------------------------------------- |
| **Pattern** | A regular expression or condition (e.g., `$3 > 100`).|
| **Action**  | The code to execute on matching lines (e.g., `{ print $1 }`).|
| **$0**      | Represents the entire current line.              |
| **$1, $2..**| Represent the first, second, etc., fields (columns).|

## 2. Built-in Variables
| Variable | Description                                      |
| :------- | :----------------------------------------------- |
| **NR**   | Number of Records (current line number).         |
| **NF**   | Number of Fields (number of columns in the line).|
| **FS**   | Field Separator (default is whitespace).         |
| **OFS**  | Output Field Separator (default is space).       |
| **RS**   | Record Separator (default is newline).           |

## 3. Practical Examples
| Task                      | Command                                           |
| :------------------------ | :------------------------------------------------ |
| **Print first column**    | `awk '{ print $1 }' file`                         |
| **Print last column**     | `awk '{ print $NF }' file`                        |
| **Sum a column**          | `awk '{ sum += $1 } END { print sum }' file`      |
| **Filter by line number** | `awk 'NR > 5 && NR < 10' file`                    |
| **Search for string**     | `awk '/pattern/ { print $0 }' file`               |
| **Custom separator**      | `awk -F: '{ print $1 }' /etc/passwd`              |

## 4. Blocks: BEGIN and END
- **BEGIN { ... }**: Executed once before any input is read (ideal for headers or setting variables).
- **END { ... }**: Executed once after all input has been processed (ideal for totals and summaries).

```bash
awk 'BEGIN { print "START" } { print $1 } END { print "DONE" }' file
```

## 5. Configuration
Awk doesn't have a traditional config file, but you can store complex logic in scripts:

- **Script File:** `script.awk`
- **Execution:** `awk -f script.awk input_file`
- **Setting Variables:** Use the `-v` flag (e.g., `awk -v threshold=100 '$3 > threshold' file`).

## 6. Pro Tips & Gotchas
- **Column Counting:** If you're unsure how many columns a file has, `awk '{ print NF; exit }' file` will tell you for the first line.
- **Empty Lines:** Awk considers empty lines as having 0 fields. Use `NF > 0` to skip them.
- **Math Operations:** Awk handles floating-point math naturally, making it much better than Bash for calculations.
- **FS gotcha:** When using `-F`, remember that if your field contains the separator inside quotes, standard `awk` will still split it. For CSVs, consider specialized tools like `csvkit`.

---

## 🔗 See Also
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master the pipes that feed data into awk.
- [Power User Toolkit](../terminal/POWER_USER_TOOLKIT.md): Modern alternatives like `jq` for JSON data.
- [Modern Alternatives](../terminal/MODERN_ALTERNATIVES.md): Fast search tools to combine with awk.
