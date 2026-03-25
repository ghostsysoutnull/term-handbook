# Scenario: The Merge Conflict from Hell

**The Crisis:** You've been working on a critical feature for three days. Meanwhile, your teammate refactored the core database logic. When you try to merge `main` into your feature branch, Git gives up: `Automatic merge failed; fix conflicts and then commit the result.` You open the file, and it's a mess of `<<<<<<<`, `=======`, and `>>>>>>>` across 500 lines of code.

## 1. The Investigation: Taking a Breath
First, you don't panic. You want to see exactly what changed on both sides without the confusing Git markers.

```bash
# Abort the messy merge to get a clean slate
git merge --abort

# Stash your current work just in case
git stash
```

## 2. The Solution: Surgical Comparison with Vim
Instead of a blind merge, you decide to use Vim's powerful diffing capabilities to compare your branch with `main` side-by-side.

```bash
# Compare your feature branch against main for the specific file
vim -d feature-file.js main:feature-file.js
```

Vim opens in **Diff Mode** with two vertical splits.
- Differences are highlighted in red/purple.
- Identical lines are folded away.

## 3. The Resolution: Moving Changes
You navigate through the differences using `]c` (next change) and `[c` (previous change).
- To pull a change from the right (main) to the left (your branch), you use `:diffget`.
- To push your change to the other side, you use `:diffput`.

For the most complex sections, you simply edit the text manually in the left pane, combining the best of both worlds.

## 4. The Aftermath: Committing with Confidence
Once the file in the left pane looks perfect, you save and quit.

```bash
# Re-apply the merge now that you know exactly how to fix it
git merge main
# (Fix the file again using your now-perfected logic)
git add feature-file.js
git commit -m "chore: resolve complex merge conflict in core logic"
```

### Senior Engineer's Retrospective
- **Tool Choice:** `vim -d` (or `vimdiff`) provides much better context than standard text markers.
- **Workflow:** Aborting a failed merge and using a stash creates a safety net.
- **Precision:** Vertical splits allow you to see the "Before" and "After" simultaneously, preventing accidental deletion of logic.
- **Lesson:** Conflict is inevitable in teams. Don't fight the markers; use tools that make the differences visible.

---

## 🔗 Related Guides
- [Vim Basics](../editors/VIM_GUIDE.md): Master navigation and splits.
- [Git Guide](../development/GIT_GUIDE.md): Master stashing and merging.
- [Vim Advanced](../editors/VIM_ADVANCED.md): Use advanced movement to jump between changes.
