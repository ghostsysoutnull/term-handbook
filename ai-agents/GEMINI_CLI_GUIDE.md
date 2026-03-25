# Gemini CLI Guide: AI-Powered Terminal Agent

A quick reference for using Gemini CLI to safely and effectively automate software engineering tasks.

## 1. Core Workflow
Gemini CLI operates on a **Research -> Strategy -> Execution** lifecycle.

| Phase | Goal                                            | Tooling                                          |
| :---- | :---------------------------------------------- | :----------------------------------------------- |
| **Research** | Understand the codebase and reproduce issues. | `grep_search`, `read_file`, `glob`.              |
| **Strategy** | Design a solution and get user approval.        | `write_file` (Plan), `ask_user`.                 |
| **Execution**| Implement, test, and validate changes.          | `replace`, `run_shell_command`, `git commit`.    |

## 2. Operational Modes
| Mode | Description                                      | Key Behavior                                     |
| :--- | :----------------------------------------------- | :----------------------------------------------- |
| **Plan Mode** | Used during the Strategy phase.                 | Edits the plan file; no code changes allowed.    |
| **Default Mode**| Used during the Execution phase.               | Surgical code edits; requires user confirmation. |
| **YOLO Mode** | Autonomous mode for minimal interruptions.      | Executes changes without asking for confirmation.|

## 3. Project Context Files
Gemini CLI respects specific files in your repository to tailor its behavior.

- **`GEMINI.md`**: Foundational mandates. These take absolute precedence over general defaults (e.g., "Always align tables").
- **`.geminiignore`**: Glob patterns for files Gemini should NEVER read or modify (e.g., secrets, large binaries).
- **`.gitignore`**: Gemini also respects standard Git ignore patterns by default.

## 4. Built-in Commands
| Command | Description                                      |
| :------ | :----------------------------------------------- |
| `/help` | Display help and documentation.                  |
| `/bug`  | Report a bug or provide feedback.                |
| `/clear`| Clear the current session history (saves tokens).|
| `/exit` | Terminate the session.                           |

## 5. Sub-Agents
For complex tasks, Gemini CLI can delegate to specialized sub-agents:
- **`codebase_investigator`**: Deep analysis and architectural mapping.
- **`generalist`**: Batch refactoring and high-volume data processing.
- **`cli_help`**: Expert on Gemini CLI features and configuration.

## 6. Pro Tips & Gotchas
- **Atomic Commits:** Gemini is trained to commit changes immediately after validation. This keeps your history clean and reverts easy.
- **Context Efficiency:** Be specific with your requests. Instead of "Fix the app," try "Find why the login button is disabled in `login.ts`."
- **Validation is Key:** Never assume a change worked just because the tool returned success. Always run your tests or build scripts.
- **Explain Before Acting:** Gemini will always explain its intent before calling tools. Read these explanations to ensure it's on the right track.

---

## 🔗 See Also
- [Project Mandates](../GEMINI.md): See the specific rules we've set for this handbook.
- [Git Guide](GIT_GUIDE.md): Master the version control Gemini uses.
- [Shell Basics](../terminal/SHELL_GUIDE.md): Understand the environment Gemini operates in.
