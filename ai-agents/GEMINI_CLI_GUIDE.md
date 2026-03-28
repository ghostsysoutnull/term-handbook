# Gemini CLI Guide: AI-Powered Terminal Agent

A comprehensive reference for using Gemini CLI to safely and effectively automate software engineering tasks through a research-driven, surgical approach.

## 1. Installation and Setup
Gemini CLI requires a Google AI Studio API key and a properly configured environment.

| Step           | Action                                                                        |
| :------------- | :---------------------------------------------------------------------------- |
| **API Key**    | Obtain a key from the [Google AI Studio](https://aistudio.google.com/).       |
| **Environment** | `export GEMINI_API_KEY='your-api-key-here'`                                   |
| **Init**       | Run `gemini` in any git repository to begin.                                  |
| **Config**     | Create `~/.gemini/` for global settings or `GEMINI.md` for project rules.     |

## 2. Core Workflow
Gemini CLI operates on a strict **Research -> Strategy -> Execution** lifecycle to ensure every change is grounded in the codebase's reality.

### 2.1 Development Lifecycle Diagram
```text
[ Research ] --( Context )--> [ Strategy ] --( Approval )--> [ Execution ]
      ^                          |                              |
      |                          +----( Feedback )--------------+
      +---------------------------------------------------------+
```

| Phase         | Goal                                          | Primary Tooling                                |
| :------------ | :-------------------------------------------- | :--------------------------------------------- |
| **Research**  | Map the codebase and reproduce issues.        | `grep_search`, `read_file`, `glob`, `web_fetch`.|
| **Strategy**  | Design a surgical solution.                   | `enter_plan_mode`, `ask_user`.                 |
| **Execution** | Implement, test, and validate changes.        | `replace`, `write_file`, `run_shell_command`.  |

## 3. Toolset Overview
Gemini CLI uses a specialized toolset designed for precision and safety.

| Tool                 | Purpose                                                                   |
| :------------------- | :------------------------------------------------------------------------ |
| `grep_search`        | Fast, regex-powered search across the codebase.                           |
| `read_file`          | Reads specific line ranges to minimize context bloat.                     |
| `replace`            | Performs surgical, context-aware string replacements.                      |
| `run_shell_command`  | Executes tests, builds, and system commands (requires user confirmation). |
| `codebase_investigator`| Sub-agent for deep architectural mapping and dependency analysis.       |

## 4. Operational Modes
| Mode            | Description                                   | Key Behavior                                   |
| :-------------- | :-------------------------------------------- | :--------------------------------------------- |
| **Plan Mode**   | Used during the Strategy phase.               | Read-only research; edits a plan file for approval. |
| **Default Mode**| The standard interactive mode.                | Surgical code edits; requires user confirmation. |
| **YOLO Mode**   | Autonomous mode for trusted environments.     | Executes changes without asking for confirmation. |

## 5. Security & Safety Mandates
Safety is baked into the agent's core logic. It will never deviate from these rules:

- **Credential Protection:** It will never log, print, or commit secrets or API keys.
- **Confirmation Protocol:** Destructive actions or shell commands always require explicit user approval.
- **Empirical Reproduction:** For bug fixes, it must reproduce the failure with a test case before applying a fix.
- **Surgical Edits:** It avoids "just-in-case" refactors, focusing only on the requested task.

## 6. Configuration & Context
Gemini CLI is highly context-aware, respecting both global and local constraints.

- **Global Settings:** `~/.gemini/` - Foundational user preferences and memories.
- **Project Mandates:** `GEMINI.md` - Workspace-wide rules that override defaults.
- **Ignore Rules:** Respects `.gitignore` and `.geminiignore` to prevent unauthorized file access.
- **Sub-directory Rules:** `GEMINI.md` files in sub-folders provide localized overrides.

## 7. Built-in Commands
| Command | Description                                                                      |
| :------ | :------------------------------------------------------------------------------- |
| `/help` | Display help and documentation for the CLI and its current configuration.         |
| `/bug`  | Report a bug or provide feedback directly to the developers.                      |
| `/clear`| Clear the session history to save tokens and reset the agent's focus.             |
| `/exit` | Terminate the current session.                                                   |

## 8. Pro Tips & Gotchas
- **Context Efficiency:** Use specific file paths or grep patterns to keep the agent's "focus" narrow.
- **Session Reset:** If the agent becomes confused or history gets too long, use `/clear` to start fresh.
- **Validation:** Always verify the agent's proposed plan during the Strategy phase.
- **Sub-Agents:** Use `generalist` for repetitive batch tasks (like adding headers to 50 files) to keep the main session lean.

---

## 🔗 See Also
- [Project Mandates](../GEMINI.md): The specific rules governing this repository.
- [Git Guide](../development/GIT_GUIDE.md): Master the version control system Gemini uses for validation.
- [Shell Basics](../terminal/SHELL_GUIDE.md): Understand the environment where Gemini executes its commands.
