# SysAdmin Essentials Guide: Managing the System

A quick reference for managing services, logs, scheduled tasks, and basic security on a Linux system.

## 1. Service Management (`systemd`)
`systemctl` is the central tool for controlling the `systemd` system and service manager.

| Command                     | Description                                      |
| :-------------------------- | :----------------------------------------------- |
| `systemctl start <svc>`     | Start a service immediately.                     |
| `systemctl stop <svc>`      | Stop a running service.                          |
| `systemctl restart <svc>`   | Restart a service.                               |
| `systemctl status <svc>`    | Check if a service is running and see recent logs.|
| `systemctl enable <svc>`    | Set a service to start automatically on boot.    |
| `systemctl disable <svc>`   | Prevent a service from starting on boot.         |
| `systemctl list-units --type=service` | List all active services.              |

## 2. Log Analysis (`journalctl`)
`journalctl` is used for querying and displaying logs from `journald`.

| Command                     | Description                                      |
| :-------------------------- | :----------------------------------------------- |
| `journalctl`                | View all logs (starting from oldest).            |
| `journalctl -u <svc>`       | View logs for a specific service.                |
| `journalctl -f`             | Follow logs in real-time (like `tail -f`).       |
| `journalctl -n 50`          | Show the last 50 log entries.                    |
| `journalctl --since "1h ago"`| Show logs from the last hour.                   |
| `journalctl -p err`         | Show only error-level logs and above.            |

## 3. Scheduled Tasks (`cron`)
`cron` is a time-based job scheduler.

- **Edit Crontab:** `crontab -e`
- **List Crontab:** `crontab -l`
- **Format:** `* * * * * /path/to/command`
  - `min hour day(month) month day(week)`

| Example                     | Schedule                                         |
| :-------------------------- | :----------------------------------------------- |
| `0 0 * * *`                 | Every day at midnight.                           |
| `*/15 * * * *`              | Every 15 minutes.                                |
| `0 9 * * 1-5`               | 9:00 AM, Monday through Friday.                  |

## 4. Firewall Basics (`ufw`)
Uncomplicated Firewall (UFW) is a user-friendly frontend for managing iptables.

| Command                     | Description                                      |
| :-------------------------- | :----------------------------------------------- |
| `ufw status`                | Check firewall status.                           |
| `ufw enable`                | Turn on the firewall.                            |
| `ufw allow ssh`             | Allow incoming SSH connections (port 22).        |
| `ufw allow 80/tcp`          | Allow incoming HTTP traffic.                     |
| `ufw deny 23`               | Block telnet traffic.                            |
| `ufw limit ssh`             | Rate-limit SSH to prevent brute-force attacks.   |

## 5. Configuration
- **systemd:** Unit files are located in `/etc/systemd/system/`.
- **cron:** System-wide crontabs are in `/etc/crontab` and `/etc/cron.d/`.
- **ufw:** Configuration is stored in `/etc/ufw/`.

## 6. Pro Tips & Gotchas
- **Daemon Reload:** If you modify a `systemd` unit file, you MUST run `systemctl daemon-reload` for changes to take effect.
- **Log Size:** Use `journalctl --vacuum-time=7d` to clear logs older than 7 days if your disk is filling up.
- **Cron PATH:** `cron` jobs often have a very limited `PATH`. Always use absolute paths (e.g., `/usr/bin/python3` instead of `python3`) in your scripts.
- **UFW Order:** Firewall rules are processed in order. Always double-check your `ufw status numbered` before deleting or inserting rules.
- **Dry Run:** Use `systemctl stop <svc> --dry-run` to see what would happen without actually stopping the service.

---

## 🔗 See Also
- [Shell Basics](../terminal/SHELL_GUIDE.md): Essential for writing scripts to be scheduled via cron.
- [SSH & Networking](../terminal/SSH_GUIDE.md): Crucial context for managing firewalls and remote services.
- [htop Guide](../terminal/HTOP_GUIDE.md): Monitor the impact of services on system resources.
