# Claude CLI Guide: Terminal-based AI Assistance

A comprehensive reference for using the Claude CLI to interact with Anthropic's AI models directly from your command line, optimized for coding, refactoring, and data processing.

## 1. Installation and Setup
Most Claude CLI tools are wrappers around the official Anthropic API. Ensure your environment is configured for secure access.

| Step           | Action                                                                        |
| :------------- | :---------------------------------------------------------------------------- |
| **Install**    | `npm install -g claude-cli` (or your preferred community wrapper).            |
| **API Key**    | Obtain a key from [console.anthropic.com](https://console.anthropic.com/).    |
| **Environment** | `export ANTHROPIC_API_KEY='your-key-here'`                                   |
| **Verify**     | `claude --version`                                                            |

## 2. Core Workflow
Claude excels at processing large contexts and providing high-quality code reasoning.

### 2.1 Pipe-Process-Output Workflow
```text
[ Input Data ] ----> ( Claude CLI ) ----> [ Processed Output ]
      ^                   |                      |
      |             (System Prompt)              |
      +-------------------+----------------------+
```

| Phase         | Goal                                          | Common Command                                 |
| :------------ | :-------------------------------------------- | :--------------------------------------------- |
| **Ingestion** | Provide files or piped data for context.      | `cat src/*.ts | claude`                        |
| **Instruction**| Define the task (refactor, explain, etc.).    | `claude "Refactor this into a custom hook"`    |
| **Output**    | Receive and validate the AI's response.       | `claude -f file.py > refactored_file.py`       |

## 3. Model Selection Guide
Choosing the right model balances cost, speed, and reasoning depth.

| Model                 | Best Use Case                                | Strength                                      |
| :-------------------- | :------------------------------------------- | :-------------------------------------------- |
| **Claude 3.5 Sonnet** | Coding, complex refactors, deep reasoning.   | High intelligence, balanced speed.            |
| **Claude 3 Haiku**    | Quick scripts, log analysis, simple tasks.   | Exceptional speed, very low cost.             |
| **Claude 3 Opus**     | Massive datasets, extreme complexity.        | Deepest reasoning, higher cost and latency.   |

## 4. Advanced CLI Patterns
Leverage Unix philosophy to combine Claude with existing terminal tools.

- **Repository-wide Refactor:**
  ```bash
  find src -name "*.js" | xargs cat | claude "Convert all these files to TypeScript"
  ```
- **Log Error Diagnosis:**
  ```bash
  tail -n 100 app.log | grep "ERROR" | claude "Explain the root cause of these errors"
  ```
- **Automated Documentation:**
  ```bash
  claude -f api.py "Generate JSDoc-style documentation for this file" > api_docs.md
  ```

## 5. Security & Privacy
Anthropic provides enterprise-grade privacy controls, but terminal safety is the user's responsibility.

- **API Key Safety:** Never hardcode keys in scripts. Always use environment variables or encrypted secret managers.
- **Data Usage:** By default, data sent via the API is not used to train Anthropic's models. Verify your account settings to confirm.
- **Sensitive Data:** Be cautious when piping files that may contain secrets (e.g., `.env`, `config.json`). Use `grep -v` to filter them out before piping.

## 6. Pro Tips & Gotchas
- **System Prompts:** Use `-s` or `--system` to define a persistent persona: `claude -s "You are a Senior Go Developer" "Review this code"`.
- **Token Limits:** While Claude has a massive context window (up to 200k), piping an entire large repository may hit shell command limits or become costly.
- **JSON Output:** Use the `--json` flag for machine-readable responses when building automated pipelines.

---

## 🔗 See Also
- [Gemini CLI Guide](GEMINI_CLI_GUIDE.md): Compare Claude with our primary AI terminal agent.
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master the pipes and redirections used with Claude CLI.
- [Markdown Guide](../development/MARKDOWN_GUIDE.md): Format the AI's output correctly for your documentation.
