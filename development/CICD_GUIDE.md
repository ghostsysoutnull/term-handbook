# CI/CD Guide: Automating Your Workflow

A quick reference for Continuous Integration and Continuous Deployment using GitHub Actions.

## 1. Core Concepts
| Term           | Description                                      |
| :------------- | :----------------------------------------------- |
| **CI**         | Continuous Integration: Automatically testing and linting code on every push. |
| **CD**         | Continuous Deployment: Automatically deploying successful builds to production. |
| **Workflow**   | An automated process defined in a YAML file in `.github/workflows/`. |
| **Action**     | A reusable unit of code that performs a specific task (e.g., checkout, setup-node). |
| **Runner**     | The server that executes your GitHub Actions workflows. |

## 2. GitHub Actions Structure
Workflows are defined in `.yaml` files.

| Component      | Description                                      |
| :------------- | :----------------------------------------------- |
| `on`           | The event that triggers the workflow (e.g., `push`, `pull_request`). |
| `jobs`         | A collection of steps that run on the same runner. |
| `steps`        | Individual tasks like running a script or using an action. |
| `uses`         | Specifies a pre-built action to use.             |
| `run`          | Executes a command in the runner's shell.        |

## 3. Example: Automating Markdown Linting
To automate the `bin/lint-docs.sh` script we created, create `.github/workflows/lint.yml`:

```yaml
name: Lint Documentation
on: [push, pull_request]

jobs:
  lint:
    runs-on: ubuntu-latest
    steps:
      - name: Checkout code
        uses: actions/checkout@v4

      - name: Setup Node.js
        uses: actions/setup-node@v4
        with:
          node-version: '20'

      - name: Install markdownlint
        run: npm install -g markdownlint-cli

      - name: Run lint script
        run: ./bin/lint-docs.sh
```

## 4. Useful Built-in Actions
- `actions/checkout@v4`: Clones your repository into the runner.
- `actions/setup-node@v4`: Installs a specific version of Node.js.
- `actions/setup-python@v5`: Installs a specific version of Python.
- `actions/cache@v4`: Caches dependencies to speed up builds.

## 5. Configuration
- **File Location:** `.github/workflows/*.yml`
- **Secrets:** Store sensitive data (API keys, tokens) in **Settings > Secrets and variables > Actions**. Access them via `${{ secrets.YOUR_SECRET_NAME }}`.

## 6. Pro Tips & Gotchas
- **YAML Indentation:** YAML is extremely sensitive to spaces. Use a linter or an editor with YAML support.
- **Path Filtering:** Use `paths: ['editors/**', 'terminal/**']` in your `on` block to only run linting when documentation files change.
- **Fail Fast:** GitHub Actions will stop a job as soon as a step fails. This is good for CI but remember to check logs for the exact error.
- **Local Testing:** Use tools like `act` to run your GitHub Actions locally before pushing them.
- **Permissions:** Ensure your `bin/` scripts are executable (`chmod +x`) before committing, or the runner will fail with "Permission denied".

---

## 🔗 See Also
- [Markdown Best Practices](MARKDOWN_GUIDE.md): What our CI is actually checking for.
- [Git Guide](GIT_GUIDE.md): Essential for understanding branches and push events.
- [Docker Essentials](DOCKER_GUIDE.md): Runners often use Docker containers to execute steps.
