# GNU Screen Guide: Essential Commands

A quick reference for managing persistent terminal sessions with GNU Screen.

## 1. Session Management
- `screen`: Start a new anonymous session.
- `screen -S <name>`: Start a new named session.
- `screen -ls`: List all running screen sessions.
- `screen -r <pid_or_name>`: Reattach to a detached session.
- `screen -d -r <pid_or_name>`: Detach the session from its current terminal and reattach here.
- `screen -x <pid_or_name>`: Attach to a session even if it is already attached (multi-display mode).
- `Ctrl-a d`: Detach from the current session (keeps it running in the background).

## 2. Window Management (Within Screen)
All commands start with the escape sequence **Ctrl-a**.

- `Ctrl-a c`: Create a new window.
- `Ctrl-a n`: Go to the next window.
- `Ctrl-a p`: Go to the previous window.
- `Ctrl-a 0..9`: Switch to window by number.
- `Ctrl-a "` (quote): List all windows and select one.
- `Ctrl-a w`: List all windows (displayed in the status line).
- `Ctrl-a A`: Rename the current window.
- `Ctrl-a k`: Kill (close) the current window.
- `exit`: Typing 'exit' in the shell also closes the window.

## 3. Split Screen (Regions)
- `Ctrl-a S` (uppercase): Split current region horizontally.
- `Ctrl-a |` (pipe): Split current region vertically.
- `Ctrl-a Tab`: Switch focus to the next region.
- `Ctrl-a X` (uppercase): Close the current region.
- `Ctrl-a Q` (uppercase): Close all regions except the current one.

## 4. Useful Features
- `Ctrl-a [`: Enter **Copy/Scrollback Mode**.
    - Use arrow keys or `h/j/k/l` to move.
    - `Ctrl-b` / `Ctrl-f`: Page up/down.
    - `Esc`: Exit scrollback mode.
- `Ctrl-a ?`: Show help (list of all key bindings).
- `Ctrl-a :`: Enter command line mode.
