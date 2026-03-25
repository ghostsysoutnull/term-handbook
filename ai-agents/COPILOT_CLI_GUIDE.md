# GitHub Copilot CLI Guide: The Agentic Shell

A quick reference for the modern GitHub Copilot CLI, a full agentic development environment that plans, executes, and verifies tasks directly in your terminal.

## 1. Installation and Authentication
Requires **Node.js v22+** and **npm v10+**.

| Step           | Action                                           |
| :------------- | :----------------------------------------------- |
| **Install**    | `npm install -g @github/copilot`                 |
| **Login**      | `copilot` (Follow browser authentication prompts).|
| **Homebrew**   | `brew install copilot-cli`                       |

## 2. Core Operational Commands
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `copilot`              | Launch the interactive agent session.            |
| `copilot -p "prompt"`  | Execute a single instruction in "headless" mode. |
| `gh copilot suggest`   | (Legacy) Get shell command suggestions.          |
| `gh copilot explain`   | (Legacy) Explain a specific shell command.       |

## 3. In-Session Commands & Shortcuts
Once you are inside an active `copilot` session, use these to manage the agent.

| Command / Key  | Action                                           |
| :------------- | :----------------------------------------------- |
| `/plan`        | Switch to **Plan Mode** to map out changes.      |
| `/model`       | Switch AI models (e.g., GPT-4o, Claude 3.5).     |
| `/mcp`         | Manage Model Context Protocol (MCP) servers.     |
| `/context`     | View or modify what the agent can see.           |
| `/share`       | Save the session as a Markdown file or Gist.     |
| `/compact`     | Compress chat history to save tokens.            |
| `Shift + Tab`  | Quickly toggle between Planning and Acting.      |
| `Ctrl + R`     | View logs of all executed commands.              |

## 4. Automation: Autopilot Mode
Copilot can run autonomously for repetitive or multi-step tasks.

- **Enable:** Usually via `/permissions` or a specific session flag.
- **Security:** Even in Autopilot, you can monitor the command logs in real-time.
- **Delegation:** Use `& <prompt>` to move a task to the background cloud agent.

## 5. Project Context: `GEMINI.md`
To ensure Copilot follows your specific project standards:
- Create a `GEMINI.md` or `.copilot-instructions` file in your root.
- Add mandates like "Always use functional components" or "Align all tables."
- Copilot will automatically prioritize these rules over its default behavior.

## 6. Pro Tips & Gotchas
- **MCP Integration:** Use `/mcp add` to connect Copilot to tools like Jira, Slack, or your internal databases.
- **Terminal Graphics:** Copilot can analyze screenshots or diagrams if your terminal supports image protocols.
- **Permissions:** If a command fails, check if the agent has the necessary filesystem or network permissions.
- **Incremental Edits:** For large refactors, use `/plan` first. Copilot is much more reliable when it follows a step-by-step strategy.

---

## 🔗 See Also
- [Gemini CLI Guide](GEMINI_CLI_GUIDE.md): The primary tool used to build this handbook.
- [GitHub CLI Guide](GH_GUIDE.md): Master the `gh` tool that hosts the Copilot extension.
- [codex-cli Guide](CODEX_CLI_GUIDE.md): Compare with OpenAI's local terminal agent.
