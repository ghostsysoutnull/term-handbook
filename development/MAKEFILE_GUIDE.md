# Makefile Guide: Task Automation

A quick reference for using `GNU Make` to automate project tasks, builds, and workflows.

## 1. Core Syntax
A Makefile consists of "rules". Each rule has a target, optional dependencies, and a command.

```makefile
target: dependency1 dependency2
	command
```

| Component      | Description                                      |
| :------------- | :----------------------------------------------- |
| **Target**     | Usually the name of a file or an action (e.g., `build`). |
| **Dependency**  | A file or target that must exist/run before the target. |
| **Command**    | The shell command to execute (**MUST be indented with a TAB**). |

## 2. Essential Concepts
| Feature        | Example                                           | Description                                      |
| :------------- | :------------------------------------------------ | :----------------------------------------------- |
| **Variables**  | `CC = gcc`                                        | Define reusable strings.                         |
| **Phony Targets**| `.PHONY: clean`                                 | Targets that don't represent files.              |
| **Comments**   | `# This is a comment`                             | Documentation within the Makefile.               |
| **Silent Mode**| `@echo "Done"`                                    | Prefix with `@` to hide the command itself.      |

## 3. Automatic Variables
These special variables make rules much more concise.

| Variable | Description                                      |
| :------- | :----------------------------------------------- |
| **$@**   | The name of the target.                          |
| **$<**   | The name of the first dependency.                |
| **$^**   | The names of all dependencies.                   |

## 4. Practical Automation Example
A common Makefile for a modern project (e.g., Python or Node.js):

```makefile
.PHONY: help install lint test clean

help:
	@echo "Available tasks:"
	@echo "  install - Install dependencies"
	@echo "  lint    - Run code linting"
	@echo "  test    - Run unit tests"
	@echo "  clean   - Remove build artifacts"

install:
	npm install

lint:
	./bin/lint-docs.sh

test:
	npm test

clean:
	rm -rf dist/ build/
```

## 5. Configuration
- **File Location:** Usually named `Makefile` (no extension) in the project root.
- **Execution:** 
  - `make <target>`: Run a specific target.
  - `make`: Runs the first target defined in the file.
  - `make -j 4`: Run up to 4 commands in parallel (great for speed).

## 6. Pro Tips & Gotchas
- **THE TAB GOTCHA:** Makefile commands **must** start with a real Tab character, not spaces. If you get "missing separator", check your indentation.
- **Phony Targets:** Always use `.PHONY` for action-only targets (like `clean`). This prevents `make` from getting confused if a file named `clean` actually exists.
- **Shell Logic:** Each line in a rule runs in a **separate shell**. If you need variables to persist across lines, join them with `\` and `;`.
- **Default Goal:** If you want a specific target to be the default regardless of its position, use `.DEFAULT_GOAL := target_name`.

---

## 🔗 See Also
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master the commands you'll put inside your Makefile.
- [Git Guide](GIT_GUIDE.md): Version control your Makefile to keep workflows consistent for teams.
- [CI/CD Guide](CICD_GUIDE.md): Use `make` targets as entry points for your GitHub Actions.
