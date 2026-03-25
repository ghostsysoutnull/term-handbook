# Gemini CLI Guide: AI-Powered Terminal Agent

A quick reference for using Gemini CLI to safely and effectively automate software engineering tasks.

## 1. Core Workflow
Gemini CLI operates on a **Research -> Strategy -> Execution** lifecycle.

### 1.1 Development Lifecycle Diagram
```text
[ Research ] --( Context )--> [ Strategy ] --( Approval )--> [ Execution ]
      ^                          |                              |
      |                          +----( Feedback )--------------+
      +---------------------------------------------------------+
```

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

## 3. Configuration
Gemini CLI's behavior is governed by global and local configuration.

- **Global Settings:** `~/.gemini/` - Foundational user preferences.
- **Project Mandates:** `GEMINI.md` - Workspace-wide absolute rules.
- **Ignore Rules:** `.geminiignore` and `.gitignore` - Control file visibility.
- **Environment:** `export GEMINI_API_KEY='your-key'`

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
- [Git Guide](../development/GIT_GUIDE.md): Master the version control Gemini uses.
- [Shell Basics](../terminal/SHELL_GUIDE.md): Understand the environment Gemini operates in.
