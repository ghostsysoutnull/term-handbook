# Agent Zero Guide: The Fully Autonomous AI Agent

A comprehensive reference for setting up and using Agent Zero, a high-autonomy framework that can interact with your terminal, filesystem, and web browser, powered by Ollama for complete privacy.

## 1. Installation and Setup
Agent Zero typically runs inside a Docker container. The primary challenge is bridging the network to your local Ollama instance.

| Step           | Action                                                                        |
| :------------- | :---------------------------------------------------------------------------- |
| **Ollama**     | Ensure Ollama is installed and running on your **host** machine.              |
| **Docker**     | Install Docker Desktop or Docker Engine.                                      |
| **Install A0** | `curl -fsSL https://bash.agent-zero.ai | bash`                                 |
| **Init**       | Access the Web UI at `http://localhost:80` to begin configuration.            |

## 2. Core Operational Workflow
Agent Zero uses a multi-step loop where it plans, executes code in a sandbox, and verifies the results.

### 2.1 Agent Zero Execution Loop
```text
[ Task ] --( Plan )--> [ Sandbox Execution ] --( Observation )--> [ Validation ]
    ^                          |                                      |
    |                          +----( Tool Usage: Shell/Browser )-----+
    +-----------------------------------------------------------------+
```

| Phase         | Goal                                          | Tooling Used                                   |
| :------------ | :-------------------------------------------- | :--------------------------------------------- |
| **Planning**  | Break down the user's request into steps.     | Chat Model (e.g., Llama 3.2).                 |
| **Acting**    | Execute Python, Shell, or Browser commands.   | Docker Sandbox, Selenium, OS tools.            |
| **Refinement**| Analyze output and adjust the next step.      | Utility Model (e.g., Qwen2.5-Coder).           |

## 3. Connecting to Ollama (Docker Networking)
Since Agent Zero runs in Docker, it cannot use `localhost` to reach the Ollama API on your host machine.

- **Base URL:** `http://host.docker.internal:11434`
- **Linux Users:** If `host.docker.internal` doesn't work, use your host's local IP (e.g., `192.168.1.x`) or add `--add-host=host.docker.internal:host-gateway` to the Docker run command.
- **Environment Config (.env):**
  ```env
  OLLAMA_BASE_URL="http://host.docker.internal:11434"
  CHAT_MODEL_PROVIDER="ollama"
  CHAT_MODEL_NAME="llama3.2"
  ```

## 4. Model Selection for Agent Zero
Agents require strong reasoning and tool-calling capabilities. Smaller models may fail at complex planning.

| Model                 | Best Use Case                                | Performance Rank |
| :-------------------- | :------------------------------------------- | :--------------- |
| **Qwen2.5-Coder:32B** | **(Ideal)** Excellent tool-use and reasoning.| Platinum         |
| **Llama 3.1 / 3.2**   | Reliable general agent performance.          | Gold             |
| **DeepSeek-Coder-V2** | High-speed coding and logic.                 | Gold             |
| **Phi-3.5-MoE**       | Lightweight, fast, and surprisingly capable. | Silver           |

## 5. Security & Sandboxing
Agent Zero is designed to run code, which is inherently risky. It mitigates this via strict isolation.

- **Docker Sandbox:** All code execution (Python/Shell) happens inside a dedicated container, not on your host OS.
- **Filesystem Access:** By default, it can only see files mapped to the `/a0` or `/work` directory.
- **Web Browser:** It uses an isolated Selenium instance for web searching and scraping.

## 6. Pro Tips & Gotchas
- **Context Window:** Agents generate long histories. Set `num_ctx` to at least `32768` in your Ollama/Agent Zero settings.
- **Hybrid Strategy:** Use Ollama for the core Chat Model (privacy) and a fast API like Groq for the Utility Model to speed up background tasks.
- **Persistence:** Agent Zero saves its memory in a local database. You can resume sessions or fork them to try different approaches.

---

## 🔗 See Also
- [Agentic Architectures](AGENTIC_ARCHITECTURES.md): Explore the mental models and concepts behind autonomous agents.
- [Local LLM Guide](LOCAL_LLM_GUIDE.md): Master the Ollama backend that powers Agent Zero.
- [Gemini CLI Guide](GEMINI_CLI_GUIDE.md): Compare Agent Zero with our surgical terminal agent.
- [Docker Guide](../development/DOCKER_GUIDE.md): Understand the sandboxing environment Agent Zero uses.
