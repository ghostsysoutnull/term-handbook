# Regex Master Guide: The Language of Patterns

A universal reference for Regular Expressions, the foundational skill for `grep`, `sed`, `awk`, `vim`, and modern search tools.

## 1. The Building Blocks (Characters)
| Pattern | Matches                                          | Example (`pattern`) |
| :------ | :----------------------------------------------- | :------------------ |
| `.`     | Any single character (except newline).           | `c.t` -> cat, cot   |
| `\d`    | Any digit (`0-9`).                               | `\d\d` -> 42, 07    |
| `\w`    | Any word character (`a-z`, `A-Z`, `0-9`, `_`).   | `\w+` -> word, 123  |
| `\s`    | Any whitespace (space, tab, newline).            | `\w\s\w` -> a b     |
| `\b`    | Word boundary (start or end of a word).          | `\bcat\b` -> cat    |

## 2. Quantifiers (How Many?)
| Pattern | Description                                      | Example             |
| :------ | :----------------------------------------------- | :------------------ |
| `*`     | 0 or more occurrences.                           | `lo*` -> l, lo, loo |
| `+`     | 1 or more occurrences.                           | `lo+` -> lo, loo    |
| `?`     | 0 or 1 occurrence (optional).                    | `color?` -> color, colour |
| `{n}`   | Exactly `n` occurrences.                         | `\d{3}` -> 123      |
| `{n,}`  | `n` or more occurrences.                         | `\d{2,}` -> 12, 123 |
| `{n,m}` | Between `n` and `m` occurrences.                 | `\d{2,4}` -> 12, 1234|

## 3. Anchors & Groups (Positioning)
| Pattern | Description                                      | Example             |
| :------ | :----------------------------------------------- | :------------------ |
| `^`     | Start of a line.                                 | `^Error` -> Error at start |
| `$`     | End of a line.                                   | `done$` -> done at end     |
| `[...]` | Character set (any one of these).                | `[aeiou]` -> any vowel     |
| `[^...]`| Negated set (none of these).                     | `[^0-9]` -> any non-digit  |
| `(...)` | Capturing group (extract or repeat).             | `(abc)+` -> abcabc         |
| `|`     | OR (Alternation).                                | `cat|dog` -> cat OR dog    |

## 4. Practical Cheat Sheet
| Task                       | Pattern                                          |
| :------------------------- | :----------------------------------------------- |
| **Email address**          | `[\w.-]+@[\w.-]+\.[a-zA-Z]{2,}`                  |
| **IP Address (IPv4)**      | `\d{1,3}(\.\d{1,3}){3}`                          |
| **Dates (YYYY-MM-DD)**     | `\d{4}-\d{2}-\d{2}`                              |
| **Trim trailing space**    | `\s+$`                                           |
| **Find capitalized words** | `\b[A-Z][a-z]+\b`                                |

## 5. Tool-Specific Variations (Gotchas)
Regex is powerful, but different tools use different "flavors":

- **Basic Regex (BRE):** Used by default `grep`, `sed`. Needs backslashes for `(`, `)`, `{`, `}`, `+`, `?`, `|`.
- **Extended Regex (ERE):** Use `grep -E` or `sed -E`. No backslashes needed for meta-characters.
- **Perl-Compatible (PCRE):** Use `grep -P`. Supports `\d`, `\s`, `\w` and advanced lookarounds.
- **Vim Regex:** Uses `\v` (very magic) to behave like modern ERE/PCRE.

## 6. Pro Tips & Gotchas
- **Greedy vs Lazy:** By default, `*` and `+` are "greedy"—they match as much as possible. Use `*?` or `+?` to make them "lazy" (match as little as possible).
- **Escape Meta-characters:** If you want to match a literal `.`, `*`, or `(`, you MUST escape it with a backslash: `\.`, `\*`, `\(`.
- **Testing Tools:** Use websites like [regex101.com](https://regex101.com) to visualize and debug your patterns before using them in scripts.
- **Start Small:** Don't try to build a "perfect" regex for complex HTML or nested structures; regex is best for flat, predictable patterns.

---

## 🔗 See Also
- [Vim Advanced](../editors/VIM_ADVANCED.md): Use regex for search and replace (`:%s/pattern/replacement/g`).
- [awk Guide](AWK_GUIDE.md): Filter data lines with regex patterns.
- [Power User Toolkit](POWER_USER_TOOLKIT.md): Modern search tools like `ripgrep` use PCRE by default.
