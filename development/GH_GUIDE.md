# GitHub CLI Guide: Terminal-based GitHub

A quick reference for interacting with GitHub directly from your command line.

## 1. Authentication and Setup
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `gh auth login`        | Authenticate with your GitHub account.           |
| `gh auth logout`       | Log out of your GitHub account.                  |
| `gh auth status`       | Check your current authentication status.        |
| `gh auth setup-git`    | Configure Git to use `gh` as a credential helper.|

## 2. Repository Management
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `gh repo create <n>`   | Create a new repository on GitHub.               |
| `gh repo clone <n>`    | Clone a repository locally.                      |
| `gh repo fork <n>`     | Create a fork of a repository.                   |
| `gh repo view`         | View the repository description and README.      |
| `gh repo sync`         | Sync a local repository with its remote.         |

## 3. Pull Requests (`pr`)
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `gh pr create`         | Create a new pull request.                       |
| `gh pr list`           | List pull requests in the current repository.    |
| `gh pr checkout <n>`   | Check out a PR locally by number or branch.      |
| `gh pr merge <n>`      | Merge a pull request.                            |
| `gh pr status`         | Show the status of relevant pull requests.       |

## 4. Issues
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `gh issue list`        | List issues in the current repository.           |
| `gh issue create`      | Create a new issue.                              |
| `gh issue view <n>`    | View a specific issue in the terminal.           |
| `gh issue comment <n>` | Add a comment to an issue.                       |

## 5. Gists and Actions
- **Gists:** `gh gist create <file>` — Create a new Gist from a file.
- **Actions:** `gh run list` — List recent workflow runs.
- **Actions:** `gh run watch` — Watch a running workflow for progress.

## 6. Configuration
`gh` stores its configuration in your home directory.

- **File Location:** `~/.config/gh/config.yml`
- **Useful Aliases:**
  ```bash
  gh alias set pv 'pr view'
  gh alias set rs 'repo sync'
  ```
- **Environment Variables:**
  - `GH_TOKEN`: Set a specific OAuth token.
  - `GH_EDITOR`: Set the editor used for PR/Issue descriptions.

## 7. Pro Tips & Gotchas
- **Browser Integration:** Many commands have a `--web` flag (e.g., `gh pr view --web`) to open the page in your browser instantly.
- **Default Repository:** If you're inside a Git repository, `gh` automatically assumes you're talking about that repo.
- **Formatting Output:** Use the `--json` flag to get machine-readable output for your own scripts (e.g., `gh repo list --json name,url`).
- **Interactive Prompts:** Most `gh` commands are interactive. If you're missing an argument, `gh` will usually ask you for it.

---

## 🔗 See Also
- [Git Guide](GIT_GUIDE.md): The foundational tool `gh` builds upon.
- [CI/CD Guide](CICD_GUIDE.md): Automate workflows that you can monitor with `gh`.
- [Shell Basics](../terminal/SHELL_GUIDE.md): Use pipes to process `gh` output.
