# Local LLM Guide: Private and Offline AI

A comprehensive reference for running Large Language Models (LLMs) locally using high-performance inference engines like Ollama, vLLM, and LM Studio.

## 1. Installation and Setup
Running local LLMs requires an inference engine and enough hardware (VRAM/RAM) to support the model's weights.

| Step           | Action                                                                        |
| :------------- | :---------------------------------------------------------------------------- |
| **Engine**     | `curl -fsSL https://ollama.com/install.sh | sh` (Ollama)                       |
| **Python Tool**| `pip install vllm` (For high-throughput serving)                              |
| **Verify GPU** | `nvidia-smi` or `rocminfo` to confirm drivers and hardware acceleration.      |
| **Serve**      | `ollama serve` to start the background inference API.                         |

## 2. Core Workflow
Local inference follows a simple loop of model selection, quantization, and execution.

### 2.1 Local Inference Workflow
```text
[ User Prompt ] ----> ( Inference Engine ) ----> [ Model Weights ]
      ^                        |                        |
      |                 (VRAM/RAM Check)                |
      +------------------------+------------------------+
```

| Phase         | Goal                                          | Common Command                                 |
| :------------ | :-------------------------------------------- | :--------------------------------------------- |
| **Selection** | Pick a model based on hardware and task.      | `ollama pull deepseek-coder-v2`               |
| **Quantization**| Balance model size vs. reasoning quality.    | Use `4-bit` (GGUF/EXL2) for consumer GPUs.     |
| **Inference** | Generate text or code responses.              | `ollama run mistral`                          |

## 3. Model Selection for Coding
Different models excel at different tasks. Choose based on your hardware constraints.

| Model                 | Best Use Case                                | Size (4-bit) | VRAM Req.   |
| :-------------------- | :------------------------------------------- | :----------- | :---------- |
| **DeepSeek-Coder-V2** | State-of-the-art coding, multi-language.    | ~8GB         | 12GB+       |
| **Llama 3.2 (3B/8B)** | General reasoning, quick scripts.            | 2GB / 5GB    | 4GB / 8GB   |
| **Mistral / Codestral**| Balanced coding and logical reasoning.      | ~12GB        | 16GB+       |
| **Qwen2.5-Coder**     | Excellent performance in smaller sizes.      | ~4GB         | 6GB+        |

## 4. Advanced Usage & Integration
Local LLMs can be integrated into your development environment via standard APIs.

- **OpenAI Compatible API:**
  Most engines expose an API at `http://localhost:11434/v1` (Ollama) or `http://localhost:8000/v1` (vLLM) that mirrors the OpenAI format.
- **Custom Modelfiles (Ollama):**
  Create a file named `Modelfile` to define system prompts and parameters:
  ```dockerfile
  FROM codellama
  PARAMETER temperature 0.1
  SYSTEM "You are a Senior Rust Engineer specializing in systems programming."
  ```
  Then build: `ollama create my-coder -f Modelfile`

## 5. Security & Privacy
One of the primary reasons for local LLMs is data sovereignty.

- **Air-Gapped Usage:** Engines like Ollama can run entirely without an internet connection once the model is downloaded.
- **Endpoint Protection:** By default, Ollama only listens on `127.0.0.1`. If you change this to `0.0.0.0`, ensure you have a firewall or reverse proxy with authentication.
- **No Training:** Unlike cloud providers, your local engine **never** uploads your prompts or code for model training.

## 6. Pro Tips & Gotchas
- **VRAM Spillage:** If a model exceeds your VRAM, it will "spill over" into system RAM. This is **10-100x slower**. Always check `btop` or `nvtop` to monitor memory usage.
- **Quantization (GGUF):** Use `q4_k_m` (4-bit) as a starting point. It offers the best balance of speed and reasoning quality for most tasks.
- **Context Window:** Local models often default to small context windows (2k-8k). Increase this using `PARAMETER num_ctx 32768` in your Modelfile if your VRAM allows.

---

## 🔗 See Also
- [Gemini CLI Guide](GEMINI_CLI_GUIDE.md): Use Gemini as a front-end for your local Ollama API.
- [Sysadmin Guide](../terminal/SYSADMIN_GUIDE.md): Monitor GPU/CPU usage while running models.
- [Python Guide](../languages/NODEJS_GUIDE.md): Learn to script around your local LLM APIs.
