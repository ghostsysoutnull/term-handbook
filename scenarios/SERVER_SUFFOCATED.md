# Scenario: The Server that Suffocated

**The Crisis:** You get a page at 4:00 AM. The main application server is completely unresponsive. When you try to SSH in, it takes forever, and when you finally get a prompt, every command you type returns: `No space left on device`. The server has hit 100% disk usage, and it's so "suffocated" that it can't even write temporary session files to let you work comfortably.

## 1. The Investigation: Finding the Weight
You need to find where the bloat is, but a standard `du -sh /` will take ten minutes to scan the whole drive—time you don't have. You start with a high-level check.

```bash
# Check which partition is full
df -h
```

It's the root partition `/`. You decide to look for unusually large files directly, skipping the slow directory-by-directory summation.

```bash
# Find files larger than 500MB in /var (a common culprit)
sudo find /var -type f -size +500M -exec ls -lh {} +
```

The output reveals a massive 42GB file: `/var/log/app/debug_trace.log`. Someone left "debug" mode on in production.

## 2. The Trap: The Deleted-but-Open File
Your first instinct is to run `rm /var/log/app/debug_trace.log`. **Stop.** If the application process still has that file open, deleting it won't actually free up the disk space until the process is restarted, but the file will be invisible to `ls`. This is a classic "ghost file" trap.

## 3. The Solution: Surgical Truncation
Instead of deleting the file, you "truncate" it. This empties the contents of the file while keeping the file descriptor intact, immediately freeing the space without confusing the running application.

```bash
# Safely empty the file without deleting it
sudo truncate -s 0 /var/log/app/debug_trace.log
```

You run `df -h` again. Capacity is down to 45%. The server can breathe!

## 4. The Aftermath: Preventing Re-Suffocation
You identify that the log rotation policy wasn't applied to this new `debug_trace.log`. You immediately fix the `logrotate` configuration.

```bash
# Check logrotate config
sudo nano /etc/logrotate.d/app
```

You add the new log file to the rotation list with a `maxsize 100M` limit to ensure this never happens again.

### Senior Engineer's Retrospective
- **Tool Choice:** `find` with the `-size` flag is often faster than `du` when you're looking for specific large culprits.
- **Precision:** `truncate` is the "pro move" for full disks. It frees space immediately without breaking the application's handle on the file.
- **Awareness:** Always be wary of "deleted" files that are still held open by processes (`lsof | grep deleted` is a great way to find them).
- **Lesson:** Disk space is a finite resource. Monitoring should alert you at 80%, not 100%.

---

## 🔗 Related Guides
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master `find` and `ls` flags.
- [SysAdmin Essentials](../terminal/SYSADMIN_GUIDE.md): Master log management and service monitoring.
- [Modern Alternatives](../terminal/MODERN_ALTERNATIVES.md): Tools like `dust` or `ncdu` can make finding large files even easier.
