# Local LLM Guide: Private and Offline AI

A reference for running Large Language Models (LLMs) locally using popular inference engines like Ollama, vLLM, and LM Studio.

## 1. Core Workflow
Running a local LLM involves selecting an engine, downloading a quantized model, and interacting via a CLI or API.

### 1.1 Local Inference Workflow
```text
[ User Prompt ] ----> ( Inference Engine ) ----> [ Model Weights ]
      ^                        |                        |
      |                 (VRAM/RAM Check)                |
      +------------------------+------------------------+
```

## 2. Popular Inference Engines
| Engine       | Best For                          | Primary Command         |
| :----------- | :-------------------------------- | :---------------------- |
| **Ollama**   | Simple CLI & ease of use          | `ollama run <model>`    |
| **vLLM**     | High-throughput production APIs   | `python -m vllm.entrypoints.openai.api_server` |
| **LM Studio**| GUI-first exploration (Cross-platform) | `lms server start`      |

## 3. Basic Commands (Ollama)
| Command               | Description                                      |
| :-------------------- | :----------------------------------------------- |
| `ollama serve`        | Start the background server.                     |
| `ollama pull <m>`     | Download a model (e.g., `llama3.2`, `mistral`).  |
| `ollama run <m>`      | Start an interactive chat session.               |
| `ollama list`         | Show all locally installed models.               |
| `ollama rm <m>`       | Delete a model to free up space.                 |

## 4. Configuration
Proper configuration ensures models run efficiently on your hardware.

- **Environment Variables:**
  ```bash
  export OLLAMA_HOST="0.0.0.0:11434" # Allow remote connections
  export OLLAMA_MODELS="/path/to/models" # Change model storage path
  ```
- **GPU Acceleration:** 
  Ensure `CUDA` or `ROCm` drivers are installed. Ollama detects these automatically to offload layers to VRAM.
- **Quantization:**
  Use `GGUF` or `EXL2` formats to run large models on consumer hardware by reducing precision (e.g., 4-bit).

## 5. Pro Tips & Gotchas
- **VRAM Management:** If a model is too large for your GPU, the engine will "spill over" to system RAM, significantly slowing down inference.
- **Context Window:** Local models often have smaller default context windows. Adjust these in your `Modelfile` or engine settings.
- **System Requirements:** A minimum of 16GB RAM is recommended for 7B-8B parameter models (4-bit quantized).
- **Security:** Local LLMs are private, but ensure the API endpoints (default `11434`) are not exposed to the public internet without a proxy.

---

## 🔗 See Also
- [Gemini CLI Guide](GEMINI_CLI_GUIDE.md): Use Gemini as a front-end for your local Ollama API.
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master the environment where your LLM server runs.
- [Sysadmin Guide](../terminal/SYSADMIN_GUIDE.md): Monitor GPU/CPU usage while running models.
