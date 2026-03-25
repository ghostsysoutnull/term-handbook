# The Git Time Traveler: Recovering from the Void

**The Scenario:** It's 3:00 AM. You were trying to "clean up" your local history before a PR. You ran a `git reset --hard HEAD~5` to squash some commits, but realized you just deleted the last three days of work. Even worse, you had already `git push --force` to your branch. The commits are gone from the log, and the files are gone from your disk.

**The Mission:** Use the Git "flight recorder" to find the orphaned commits and restore the branch to its former glory.

---

## 🛠️ The Toolkit
- `git reflog`: The local history of every `HEAD` movement.
- `git show`: Inspecting the content of orphaned commits.
- `git branch <name> <hash>`: Re-anchoring a branch to a lost commit.
- `git cherry-pick`: Selectively pulling lost work into a new branch.

---

## 🏃 The Recovery Workflow

### 1. Consult the Flight Recorder
The standard `git log` only shows the *current* history. `git reflog` shows everywhere `HEAD` has been, including resets, rebases, and commits that are no longer part of any branch.

```bash
git reflog
```

**Output Example:**
```text
c9013c3 HEAD@{0}: reset: moving to HEAD~5
42fc1a6 HEAD@{1}: commit: docs: add local LLM guide
d6e5440 HEAD@{2}: commit: docs: add shell prompt guide
...
```

### 2. Identify the "Last Known Good" State
Look for the entry just *before* the disastrous reset. In the example above, `42fc1a6` is the commit we thought we lost.

### 3. Verify the Content
Before jumping back, verify that the commit contains the work you need.
```bash
git show 42fc1a6
```

### 4. Reconstruct the Branch
Don't try to "undo" the reset. Instead, simply point a new branch at the lost hash.
```bash
git branch recovery-branch 42fc1a6
```

Now you can switch to `recovery-branch` and find all your "deleted" files intact.

---

## 💡 The Lesson: Git Never Forgets
As long as you **committed** your work at least once, Git keeps the objects in its database for a grace period (usually 30-90 days) before the garbage collector (`git gc`) clears them. 

- **Branches are just pointers:** Deleting a branch doesn't delete the commits; it just removes the pointer.
- **The Reflog is local:** Your `reflog` only exists on your machine. If you delete your local `.git` folder, the reflog is gone forever.
- **Commit Early, Commit Often:** Even "messy" commits are better than uncommitted work, as they create a safety net in the reflog.

---

## 🔗 See Also
- [Git Guide](../development/GIT_GUIDE.md): Master the basics of branching and merging.
- [GitHub CLI](../development/GH_GUIDE.md): Manage remote PRs and recovery branches.
- [Vim Guide](../editors/VIM_GUIDE.md): Use `vimdiff` to resolve any conflicts during recovery.
