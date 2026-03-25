# codex-cli Guide: OpenAI's Coding Agent

A quick reference for `codex`, the OpenAI terminal agent for conversational coding, debugging, and repository exploration.

## 1. Installation and Authentication
| Step           | Action                                           |
| :------------- | :----------------------------------------------- |
| **Install**    | `npm install -g @openai/codex`                   |
| **Login**      | `codex login` (Authenticates with your account). |
| **Version**    | `codex --version`                                |

## 2. Basic Commands
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `codex`                | Launch the interactive terminal UI (TUI).        |
| `codex "prompt"`       | Start a session with an initial instruction.     |
| `codex resume`         | Open a picker to resume a previous session.      |
| `codex resume --last`  | Jump straight into the most recent session.      |
| `codex --image <path>` | Start a session with an image attachment.        |

## 3. Approval Modes
Codex can operate with varying levels of autonomy.

| Mode           | Description                                      |
| :------------- | :----------------------------------------------- |
| **Suggest**    | Default: Requires approval for every edit and command. |
| **Auto Edit**  | Automatically writes to files; asks before running commands. |
| **Full Auto**  | Autonomously reads, writes, and executes in a sandbox. |

## 4. In-Session Commands (TUI)
Commands available once you are inside an active Codex session.

| Command        | Action                                           |
| :------------- | :----------------------------------------------- |
| `/model`       | Switch between models (e.g., GPT-4o, o1).        |
| `/permissions` | Change the current approval mode.                |
| `/status`      | View session config and token usage.             |
| `/clear`       | Wipe the terminal and start a fresh chat.        |
| `/copy`        | Copy the latest output to your clipboard.        |
| `/exit`        | Close the current session.                       |

## 5. Configuration
Codex stores its settings and session history in your home directory.

- **Config Path:** `~/.config/codex/config.json`
- **Session History:** `~/.local/share/codex/`
- **MCP Servers:** Can be configured to extend Codex's capabilities via the Model Context Protocol.

## 6. Pro Tips & Gotchas
- **Multimodal Coding:** Use `codex --image screenshot.png "Fix the layout to match this"` to bridge the gap between design and code.
- **Context Awareness:** Codex reads your local files to understand the project structure. Be specific about which files it should focus on.
- **Subagents:** For massive tasks, Codex can spawn subagents to work on different parts of the problem in parallel.
- **Sandboxing:** When using **Full Auto**, Codex runs commands in a restricted environment for safety.

---

## 🔗 See Also
- [Gemini CLI Guide](GEMINI_CLI_GUIDE.md): Compare Codex with our primary AI terminal agent.
- [Claude CLI Guide](CLAUDE_CLI_GUIDE.md): Terminal interaction with Anthropic models.
- [Git Guide](GIT_GUIDE.md): Essential for reviewing and committing the changes Codex suggests.
