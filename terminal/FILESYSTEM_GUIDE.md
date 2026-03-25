# Linux Filesystem Hierarchy (FHS) Guide

A quick reference for understanding the standard directory structure of a Linux system.

## 1. Root Directory Structure (`/`)
The Filesystem Hierarchy Standard (FHS) defines the main directories and their contents.

| Directory | Description                                      |
| :-------- | :----------------------------------------------- |
| `/bin`    | **Essential User Binaries**: Commands needed in single-user mode (e.g., `ls`, `cp`). |
| `/boot`   | **Static Boot Files**: Kernel, initrd, and bootloader configuration. |
| `/dev`    | **Device Files**: Special files representing hardware components. |
| `/etc`    | **System-wide Configuration**: Host-specific configuration files. |
| `/home`   | **User Home Directories**: Personal files, settings, and dotfiles. |
| `/lib`    | **Essential Shared Libraries**: Libraries needed by `/bin` and `/sbin`. |
| `/media`  | **Mount Point for Removable Media**: USB sticks, CDs, etc. |
| `/mnt`    | **Temporary Mount Points**: Manually mounted filesystems. |
| `/opt`    | **Optional Software**: Large third-party applications (e.g., Google Chrome). |
| `/proc`   | **Process Information**: Virtual filesystem providing system and process info. |
| `/root`   | **Home Directory for Root**: Separate from `/home` for security. |
| `/sbin`   | **System Binaries**: Essential system administration tools (e.g., `iptables`, `fdisk`). |
| `/tmp`    | **Temporary Files**: Cleared on reboot or periodically. |
| `/usr`    | **User Utilities**: The largest share of user software and documentation. |
| `/var`    | **Variable Files**: Files that change size frequently (logs, databases, mail). |

## 2. Deep Dive: `/usr` (Unix System Resources)
Most user-installed software lives here.

- `/usr/bin`: Most user commands (not essential for system rescue).
- `/usr/lib`: Libraries for the binaries in `/usr/bin`.
- `/usr/local`: Where users should manually install their own software (prevents overwriting system files).
- `/usr/share`: Architecture-independent data (icons, man pages, themes).

## 3. Deep Dive: `/var` (Variable Data)
- `/var/log`: System logs (view with `journalctl` or `less`).
- `/var/mail`: User mailbox files.
- `/var/spool`: Tasks waiting to be processed (print jobs, cron jobs).
- `/var/tmp`: Temporary files preserved between reboots.

## 4. Virtual Filesystems (`/proc` and `/sys`)
These directories don't exist on disk; they are windows into the Linux kernel.

- **`/proc/cpuinfo`**: Details about your processor.
- **`/proc/meminfo`**: Real-time memory usage.
- **`/proc/[pid]`**: Information about a specific running process.
- **`/sys`**: Information about devices, drivers, and some kernel features.

## 5. Pro Tips & Gotchas
- **Case Sensitivity:** Remember that Linux filesystems are **case-sensitive**. `File.txt` and `file.txt` are different files.
- **Dotfiles:** Files starting with a `.` are hidden by default. They are usually found in your `$HOME` directory.
- **Everything is a File:** In Linux, hardware devices, directories, and even network sockets are represented as files.
- **Permissions:** If you can't access a directory, use `ls -ld <dir>` to check ownership and permissions.
- **Lost and Found:** The `/lost+found` directory is used by `fsck` to recover fragments of corrupted files after a crash.

---

## 🔗 See Also
- [Shell Basics](SHELL_GUIDE.md): Master navigating these directories with `cd`, `ls`, and `pwd`.
- [SysAdmin Essentials](SYSADMIN_GUIDE.md): Context for managing services and logs in `/etc` and `/var`.
- [SSH & Networking](SSH_GUIDE.md): Context for remote file transfer into these locations.
