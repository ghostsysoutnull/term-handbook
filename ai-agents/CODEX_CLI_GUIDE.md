# codex-cli Guide: OpenAI's Coding Agent

A comprehensive reference for `codex`, the OpenAI terminal agent for conversational coding, debugging, and repository exploration.

## 1. Installation and Setup
Ensure your environment is set up for high-autonomy coding tasks.

| Step           | Action                                                                        |
| :------------- | :---------------------------------------------------------------------------- |
| **Install**    | `npm install -g @openai/codex`                                                |
| **Login**      | `codex login` (Follow browser authentication prompts).                        |
| **Homebrew**   | `brew install codex`                                                          |
| **Config**     | Create `~/.config/codex/config.json` for custom settings.                     |

## 2. Core Operational Workflow
Codex operates with varying levels of autonomy depending on your confidence and project scope.

### 2.1 Sandbox Execution Workflow
```text
[ Codex Core ] <----> [ Sandbox Manager ] ----> [ Filesystem Edits ]
       |                      |             |
       +----(User Approval)---+             +--> [ Command Execution ]
```

| Phase         | Goal                                          | Common Command                                 |
| :------------ | :-------------------------------------------- | :--------------------------------------------- |
| **Research**  | Index the repo and understand dependencies.   | `codex --index .`                              |
| **Drafting**  | Generate changes in a temporary sandbox.      | `codex "Refactor the authentication flow"`     |
| **Validation**| Run tests and verify sandbox changes.         | `codex validate`                               |

## 3. Approval Modes
Define how much control you want to delegate to the agent.

| Mode           | Description                                                                   |
| :------------- | :---------------------------------------------------------------------------- |
| **Suggest**    | **(Safe)** Requires approval for every single edit and command.              |
| **Auto Edit**  | **(Balanced)** Automatically writes to files; asks before running shell commands. |
| **Full Auto**  | **(Autonomous)** Reads, writes, and executes in a sandboxed environment.     |

## 4. Advanced Workflows
### 4.1 MCP (Model Context Protocol) Integration
Codex supports MCP to extend its knowledge into your favorite tools.

- **Add Server:** `codex mcp add <url-or-command>`
- **Use Case:** Connect to Jira to read issues or Slack to post progress updates directly from the CLI.

### 4.2 Multimodal Repository Exploration
- **Image-to-Code:** `codex --image screenshot.png "Fix the layout to match this visual design."`
- **Diagram Analysis:** Provide architectural diagrams to help Codex understand complex system flows.

## 5. In-Session Commands (TUI)
Manage the active agent session without leaving the terminal UI.

| Command        | Action                                                                        |
| :------------- | :---------------------------------------------------------------------------- |
| `/model`       | Switch models (e.g., `gpt-4o` for speed, `o1` for complex logic).             |
| `/permissions` | Dynamically change the current approval mode (Suggest/Auto/Full).            |
| `/status`      | View token usage, active MCP servers, and sandbox state.                      |
| `/clear`       | Wipe the current session context to save tokens and reset focus.              |

## 6. Pro Tips & Gotchas
- **Sandboxing:** When using **Full Auto**, Codex executes commands in a restricted container. If a build fails due to missing dependencies, you may need to grant it network access.
- **Context Indexing:** Run `codex --index` on large repositories. This creates a vector index that helps Codex find relevant code faster.
- **Sub-agents:** For massive refactors, use `/spawn` to create specialized sub-agents that work on independent modules in parallel.

---

## 🔗 See Also
- [Gemini CLI Guide](GEMINI_CLI_GUIDE.md): Compare Codex with our primary AI terminal agent.
- [Claude CLI Guide](CLAUDE_CLI_GUIDE.md): Terminal interaction with Anthropic models.
- [Git Guide](../development/GIT_GUIDE.md): Essential for reviewing and committing the changes Codex suggests.
