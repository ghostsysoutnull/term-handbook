# tmux Guide: Essential Commands

A quick reference for terminal multiplexing with tmux.

## 1. Session Management
- `tmux`: Start a new anonymous session.
- `tmux new -s <name>`: Start a new named session.
- `tmux ls`: List all active sessions.
- `tmux attach -t <name>`: Reattach to a session.
- `tmux detach`: Detach from the current session (or use `Ctrl-b d`).
- `tmux kill-session -t <name>`: Terminate a session.

## 2. Global Prefix
All shortcuts start with the prefix sequence **Ctrl-b** (by default).

## 3. Window Management
- `Ctrl-b c`: Create a new window.
- `Ctrl-b n`: Go to the next window.
- `Ctrl-b p`: Go to the previous window.
- `Ctrl-b 0..9`: Switch to window by number.
- `Ctrl-b w`: List all windows and select one.
- `Ctrl-b ,`: Rename the current window.
- `Ctrl-b &`: Kill the current window.

## 4. Pane Management (Splits)
- `Ctrl-b %`: Split current pane vertically.
- `Ctrl-b "` (double quote): Split current pane horizontally.
- `Ctrl-b <arrow_keys>`: Switch focus between panes.
- `Ctrl-b x`: Close the current pane.
- `Ctrl-b z`: Toggle pane zoom (maximize/restore).
- `Ctrl-b q`: Briefly show pane numbers.
- `Ctrl-b o`: Rotate focus between panes.

## 5. Resizing Panes
- `Ctrl-b Ctrl-<arrow_keys>`: Resize the current pane by 1 cell.
- `Ctrl-b Alt-<arrow_keys>`: Resize the current pane by 5 cells.

## 6. Copy Mode & Scrolling
- `Ctrl-b [`: Enter **Copy Mode**.
    - Use arrow keys or `h/j/k/l` (if vi-mode enabled) to move.
    - `Space`: Start selection.
    - `Enter`: Copy selection and exit copy mode.
- `Ctrl-b ]`: Paste the last copied buffer.
- `Esc`: Exit copy mode.

## 8. Pro Tips & Gotchas
- **Accidental Window Close:** If you accidentally close a pane or window, it's gone. Use `Ctrl-b d` to safely detach instead.
- **Scrollback Issues:** If your mouse doesn't scroll naturally, you're not alone. Use `Ctrl-b [` to enter copy mode and scroll with arrow keys or `Page Up/Down`.
- **Prefix Fatigue:** Most power users remap `Ctrl-b` to `Ctrl-a` in `.tmux.conf` for easier access (Screen uses `Ctrl-a` as well).
- **Pane Management:** If you lose track of which pane is active, `Ctrl-b q` briefly shows pane numbers.
- **Detached Sessions:** If you're not sure if you have sessions running, `tmux ls` will show them all.
- **Session Recovery:** If your SSH connection drops, your tmux session will keep running. Just `tmux attach` when you reconnect.
