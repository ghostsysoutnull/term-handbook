# Git Guide: Essential Commands

A quick reference for source control management with Git.

## 1. Setup and Initialization
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `git init`             | Initialize a new local Git repository.           |
| `git clone <url>`      | Clone an existing remote repository.             |
| `git config --global user.name "Name"` | Set your globally used name.    |
| `git config --global user.email "email"`| Set your globally used email.  |

## 2. Basic Workflow
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `git status`           | Show the state of the working directory.         |
| `git add <file>`       | Stage a specific file for commit.                |
| `git add .`            | Stage all changes in the current directory.      |
| `git commit -m "msg"`  | Commit staged changes with a message.            |
| `git commit --amend`   | Modify the last commit (adds new staged files).  |
| `git log`              | Show commit history.                             |
| `git diff`             | Show differences in unstaged files.              |
| `git diff --staged`    | Show differences in staged files.                |

## 3. Branching and Merging
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `git branch`           | List all local branches.                         |
| `git branch <name>`    | Create a new branch.                             |
| `git checkout <name>`  | Switch to a specific branch.                     |
| `git checkout -b <name>`| Create and switch to a new branch.               |
| `git merge <name>`     | Merge a branch into the current one.             |
| `git branch -d <name>` | Delete a local branch.                           |

## 4. Remote Repositories
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `git remote -v`        | List all remote connections and their URLs.      |
| `git remote add origin <url>`| Connect local repo to a remote repo.       |
| `git push origin <branch>`| Push local branch to remote repository.       |
| `git pull origin <branch>`| Fetch and merge remote changes into local.    |
| `git fetch origin`     | Download objects from remote (without merging).  |

## 5. Advanced Techniques: Rebasing and Stashing
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `git rebase <branch>`  | Re-apply commits on top of another base tip.     |
| `git stash`            | Temporarily shelve current changes (to a stack). |
| `git stash pop`        | Re-apply the most recently stashed changes.      |
| `git stash list`       | Show all stashed changes.                        |
| `git checkout -- <file>`| Discard changes in a specific file.             |
| `git reset --hard HEAD`| Discard ALL local changes since last commit.     |
| `git cherry-pick <hash>`| Apply a specific commit from another branch.    |

## 7. Pro Tips & Gotchas
- **Undo a Mistake:** Use `git restore <file>` to undo unstaged changes and `git restore --staged <file>` to unstage.
- **Merge Conflicts:** If you see `CONFLICT`, Git couldn't merge automatically. Open the file, look for `<<<<<<<`, fix it, then `git add` and `git commit`.
- **Accidental Commit:** If you committed but forgot to add a file, stage it and run `git commit --amend --no-edit` to add it to the last commit.
- **Check Your History:** Use `git log --oneline --graph --all` for a clean, visual representation of your branch history.
- **Stashing:** If you need to switch branches but aren't ready to commit, `git stash` is your best friend.
