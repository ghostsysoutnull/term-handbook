# htop Guide: Interactive Process Monitoring

A quick reference for monitoring system resources and managing processes with htop.

## 1. Interface Overview
| Section         | Description                                      |
| :-------------- | :----------------------------------------------- |
| **Header**      | CPU, Memory, and Swap usage bars.                |
| **Summary**     | Tasks, Load Average, and Uptime.                 |
| **Process List**| Detailed list of all running processes.          |
| **Footer**      | Function key shortcuts (F1-F10).                 |

## 2. Navigation & Basic Shortcuts
| Key             | Action                                           |
| :-------------- | :----------------------------------------------- |
| `Up/Down`       | Scroll through the process list.                 |
| `Left/Right`    | Scroll horizontally to see more process info.    |
| `PgUp / PgDn`   | Scroll one page at a time.                       |
| `Space`         | Tag/Untag a process for bulk actions.            |
| `U`             | Untag all processes.                             |
| `F1` or `h`     | Open the help menu.                              |
| `q` or `F10`    | Quit htop.                                       |

## 3. Viewing Options
| Key             | Action                                           |
| :-------------- | :----------------------------------------------- |
| `F2` or `S`     | **Setup Menu**: Customize colors, meters, and columns. |
| `F3` or `/`     | **Search**: Find a specific process by name.     |
| `F4` or `\`     | **Filter**: Show only processes matching a string. |
| `F5` or `t`     | **Tree View**: Show process parent-child relationships. |
| `F6` or `>`     | **Sort By**: Choose a column to sort by (CPU%, MEM%, etc.). |
| `M`             | Sort by Memory usage.                            |
| `P`             | Sort by CPU usage.                               |
| `T`             | Sort by Time.                                    |

## 4. Managing Processes
| Key             | Action                                           |
| :-------------- | :----------------------------------------------- |
| `F9` or `k`     | **Kill**: Send a signal (e.g., SIGTERM, SIGKILL) to a process. |
| `F7` or `[`     | **Nice -**: Increase process priority (requires sudo). |
| `F8` or `]`     | **Nice +**: Decrease process priority.           |
| `a`             | Set CPU affinity (which CPUs the process can use).|
| `l`             | List open files for the selected process (requires `lsof`). |
| `s`             | Trace system calls with `strace`.                |

## 5. Configuration
htop settings are stored in a configuration file.

- **File Location:** `~/.config/htop/htoprc`
- **Common Customizations (via F2 Setup):**
  - **Meters:** Change bar styles to text or LED.
  - **Display Options:** Hide kernel threads or userland threads.
  - **Colors:** Choose from several built-in color schemes.
  - **Columns:** Add columns like `DISK_READ`, `DISK_WRITE`, or `PERCENT_CPU`.

## 6. Pro Tips & Gotchas
- **Run as Sudo:** Run `sudo htop` to see all processes and perform priority changes (`nice`).
- **Mouse Support:** htop supports mouse clicks for selecting processes and clicking footer buttons.
- **Tree View is Better:** Use `F5` to see which process spawned another (e.g., which shell ran which command).
- **Filtering vs. Searching:** Searching (`F3`) jumps to a process, while Filtering (`F4`) hides everything else.
- **Save on Exit:** htop automatically saves your `F2` setup changes to `htoprc` when you quit normally.

---

## 🔗 See Also
- [Shell Basics](SHELL_GUIDE.md): Master the CLI environment.
- [SSH & Networking](SSH_GUIDE.md): Monitor remote server resources.
