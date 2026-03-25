# GNU Screen vs. tmux: Key Differences

A guide to understanding the fundamental differences between these two terminal multiplexers.

## 1. Architecture
- **GNU Screen:** Each session is an independent process. If the process crashes, the session is lost.
- **tmux:** Uses a client-server architecture. The server manages all sessions in the background, making it more robust and easier to manage multiple sessions simultaneously.

## 2. Windows vs. Panes
- **GNU Screen:** Primarily focused on **Windows**. While it supports "Regions" (splits), they are temporary and tied to the current display layout. Closing a display usually closes the split layout.
- **tmux:** Built with **Panes** as first-class citizens. Split layouts are part of the window's state and persist even if you detach and reattach from a different terminal.

## 3. Status Line
- **GNU Screen:** No status line by default. You must configure it manually in `.screenrc`.
- **tmux:** Includes a highly informative, customizable status line at the bottom by default, showing active windows, session name, and system info.

## 4. Configuration & Scripting
- **GNU Screen:** Configuration (`.screenrc`) is powerful but can be cryptic. Scripting Screen from the outside is limited.
- **tmux:** Configuration (`.tmux.conf`) is more modern and readable. tmux provides a robust CLI that allows you to script almost any action (e.g., `tmux new-window`, `tmux split-window`) from a shell script.

## 5. Persistence of Layouts
- **GNU Screen:** Does not remember your split layout after detaching/reattaching by default.
- **tmux:** Preserves your exact window and pane layout across detaches and reattaches.

## 6. Default Prefix
- **GNU Screen:** `Ctrl-a` (often conflicts with "move to beginning of line" in bash).
- **tmux:** `Ctrl-b` (less likely to conflict, though many users remap it to `Ctrl-a`).

## Summary Table

| Feature           | GNU Screen               | tmux                     |
| :---------------- | :----------------------- | :----------------------- |
| **Release Date**  | 1987 (Older, ubiquitous) | 2007 (Modern, feature-rich) |
| **Architecture**  | Single process per session | Client-Server            |
| **Splits**        | Regions (fragile)        | Panes (persistent)       |
| **Status Line**   | Manual setup required    | Enabled by default       |
| **Scriptability** | Limited                  | High (via CLI)           |
| **License**       | GPLv3                    | BSD                      |
