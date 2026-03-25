# Scenario: The Zombie Process Hunter

**The Crisis:** It's Tuesday morning. The customer support channel is blowing up: "The site is slow," "I'm getting timeout errors." You SSH into the web server and notice that even simple commands like `ls` are taking a second to respond. The server is gasping for air.

## 1. The Investigation: High-Level Overview
You immediately fire up `htop` to see what's eating the CPU and RAM.

```bash
sudo htop
```

You see that the CPU is at 98% usage, but the list of processes doesn't immediately show one "big" culprit. Instead, there are hundreds of small `node` processes.

## 2. The Solution: Tree View and Parentage
You press `F5` in `htop` to switch to **Tree View**. Now you see the structure: a single `cron` job has spawned hundreds of child `node` processes that never exited. They are "Zombie" or "Orphan" processes.

## 3. The Resolution: Mass Cleanup
You need to kill all processes related to that specific faulty script. Instead of killing them one by one, you use `ps` and `grep` to find their PIDs and `xargs` to terminate them.

```bash
# Find all processes running 'cleanup_task.js' and kill them
ps aux | grep 'cleanup_task.js' | awk '{print $2}' | xargs kill -9
```

Wait, some processes are still there. You suspect they might be holding onto a specific file or port, preventing them from dying gracefully. You use `lsof` to see what files are open.

```bash
# See which process is holding the log file open
lsof /var/log/app/cleanup.log
```

You find the PID and realize it's a hung database connection. You kill the parent process, and the system finally settles down.

## 4. The Aftermath: Hardening the System
You realize the `cron` job was running every minute but sometimes took two minutes to finish, leading to a "spiral of death." You modify the crontab to use a lockfile.

```bash
# New crontab entry using flock to prevent overlapping runs
* * * * * /usr/bin/flock -n /tmp/cleanup.lock /usr/bin/node /app/cleanup_task.js
```

### Senior Engineer's Retrospective
- **Tool Choice:** `htop`'s Tree View (`F5`) was the key to seeing the parent-child relationship.
- **Precision:** `lsof` helped identify *why* a process was hung (resource contention).
- **Automation:** `flock` is a simple but powerful way to prevent process race conditions in cron.
- **Lesson:** High CPU doesn't always mean one "heavy" process; it can be "death by a thousand cuts" from poorly managed child processes.

---

## 🔗 Related Guides
- [htop Guide](../terminal/HTOP_GUIDE.md): Master the interactive monitor.
- [SysAdmin Essentials](../terminal/SYSADMIN_GUIDE.md): Master `cron` and service management.
- [Shell Basics](../terminal/SHELL_GUIDE.md): Master the `ps | grep | awk` pipeline.
