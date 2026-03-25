# Claude CLI Guide: Terminal-based AI Assistance

A quick reference for using the Claude CLI to interact with Anthropic's AI models directly from your command line.

## 1. Installation and Setup
Most Claude CLI tools are wrappers around the official Anthropic API.

| Step           | Action                                           |
| :------------- | :----------------------------------------------- |
| **Install**    | `npm install -g claude-cli` (common third-party) |
| **API Key**    | Get your key from [console.anthropic.com](https://console.anthropic.com/). |
| **Configure**  | `export ANTHROPIC_API_KEY='your-key-here'`       |

## 2. Basic Usage
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `claude "prompt"`      | Send a single prompt to Claude.                  |
| `claude -i`            | Start an interactive chat session.               |
| `cat file.txt | claude`| Pipe file content to Claude for processing.      |
| `claude --model <m>`   | Specify a model (e.g., `claude-3-5-sonnet`).     |

### 2.1 Pipe-Process-Output Workflow
```text
[ Input Data ] ----> ( Claude CLI ) ----> [ Processed Output ]
      ^                   |                      |
      |             (System Prompt)              |
      +-------------------+----------------------+
```

## 3. Working with Files
Claude CLI is excellent for refactoring or explaining local code.

- **Explain Code:** `claude -f main.py "Explain how this function works"`
- **Refactor:** `claude -f styles.css "Modernize this CSS using Flexbox"`
- **Summarize:** `claude -f long_log.txt "Summarize the errors found in these logs"`

## 4. Advanced Features
| Flag           | Description                                      |
| :------------- | :----------------------------------------------- |
| `-s, --system` | Set a system prompt to define Claude's behavior. |
| `-t, --tokens` | Set the maximum number of tokens to generate.    |
| `-v, --verbose`| Show detailed request/response information.      |
| `--json`       | Output the response in JSON format.              |

## 5. Configuration
Configuration is usually handled via environment variables or a config file.

- **Environment Variables:**
  ```bash
  export ANTHROPIC_API_KEY='your-key-here'
  export CLAUDE_MODEL='claude-3-5-sonnet'
  ```
- **Config File:** Often located at `~/.config/claude/config.json`.

## 6. Pro Tips & Gotchas
- **Piping Mastery:** You can use Claude as a filter in a Unix pipeline: `grep "ERROR" logs.txt | claude "Explain these errors"`.
- **System Prompts:** Use system prompts to make Claude act as a specific persona, like a "Senior Rust Engineer" or "Technical Writer."
- **Token Limits:** Be mindful of the context window. Piping massive directories might exceed token limits or become expensive.
- **Cost Management:** Always check which model you are using. `opus` is more capable but significantly more expensive than `sonnet` or `haiku`.

---

## 🔗 See Also
- [Gemini CLI Guide](GEMINI_CLI_GUIDE.md): Compare Claude with our primary terminal assistant.
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master the pipes and redirections used with Claude CLI.
- [Markdown Guide](../development/MARKDOWN_GUIDE.md): Format the AI's output correctly.
