# Markdown Guide: Best Practices

A quick reference for writing clean, consistent, and highly readable documentation using Markdown.

## 1. Structural Elements
| Element        | Syntax                                          | Description                                      |
| :------------- | :---------------------------------------------- | :----------------------------------------------- |
| **Headers**    | `# H1`, `## H2`, `### H3`                       | Use consistent nesting levels.                   |
| **Emphasis**   | `**bold**`, `*italic*`, `~~strikethrough~~`     | Use bold for focus, italics for subtle emphasis. |
| **Lists**      | `- item`, `1. item`                             | Use `-` for bullets, `1.` for sequences.         |
| **Links**      | `[Text](URL)`                                   | Keep text descriptive (avoid "click here").      |
| **Images**     | `![Alt text](URL)`                              | Always include descriptive alt text.             |

## 2. Advanced Formatting
| Feature        | Syntax                                          | Description                                      |
| :------------- | :---------------------------------------------- | :----------------------------------------------- |
| **Tables**     | `| col1 | col2 |`                           | Always align columns for human readability.      |
| **Code Blocks**| ` ```lang ` ... ` ``` `                        | Use language identifiers for syntax highlighting.|
| **Blockquotes**| `> text`                                        | Use for citations or high-priority notes.        |
| **Task Lists** | `- [ ] todo`, `- [x] done`                      | Great for tracking progress.                     |
| **Footnotes**  | `text[^1]`, `[^1]: note`                        | Useful for technical definitions or references.  |

## 3. Code & Syntax Highlighting
Always specify the language for code blocks to ensure proper highlighting:

```python
def hello_world():
    print("Hello, Markdown!")
```

For inline code, use single backticks: `git status`.

## 4. Best Practices for Readability
- **Header Nesting:** Avoid skipping levels (e.g., don't jump from `#` to `###`).
- **Whitespace:** Use blank lines between paragraphs and before/after headers.
- **Table Alignment:** Keep your source Markdown tables aligned so they are readable in a plain text editor.
- **Meaningful Links:** `[Git Documentation](https://git-scm.com/docs)` is better than `[here](https://git-scm.com/docs)`.

## 5. Tools & Ecosystem
- **Linters:** Use `markdownlint` to catch styling inconsistencies.
- **Formatters:** Use `prettier` to automatically align tables and fix spacing.
- **Editors:** VS Code, Obsidian, and Neovim (with `peek.nvim` or `glow`) provide excellent live previews.

## 6. Pro Tips & Gotchas
- **Hard Line Breaks:** To force a line break, end a line with two spaces or use a backslash `\`.
- **Special Characters:** Escape Markdown syntax characters with a backslash if you want them to appear literally (e.g., `\*not italic\*`).
- **Table Complexity:** Markdown tables are for simple data. For complex layouts, consider a list or a dedicated diagram tool.
- **Consistent Lists:** Don't mix `-` and `*` for bullet points in the same document.

---

## 🔗 See Also
- [Vim Guide](../editors/VIM_GUIDE.md): Master the editor where you write your Markdown.
- [Git Guide](GIT_GUIDE.md): Version control your documentation.
- [Project Plan](../PROGRESS_PLAN.md): See how we use Markdown to track progress!
