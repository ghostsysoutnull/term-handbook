# Terminal Web Browsers: Browsing without a GUI

A quick reference for navigating the web directly from your terminal using text-based browsers.

## 1. Popular Terminal Browsers
| Browser | Description                                      | Key Feature                                      |
| :------ | :----------------------------------------------- | :----------------------------------------------- |
| **lynx**| The oldest and most classic terminal browser.    | Highly compatible, strictly text-based.          |
| **w3m** | A modern, powerful terminal browser.             | Supports tables, frames, and even images (with `w3m-img`). |
| **links** / **elinks**| Feature-rich browsers with menu systems. | Excellent support for tables and basic CSS.      |

## 2. Common Navigation & Shortcuts
While each browser has its own set of keys, many share these common patterns:

| Key             | Action                                           |
| :-------------- | :----------------------------------------------- |
| `g`             | **Go to URL**: Open a prompt to enter a website address. |
| `Arrows`        | Navigate between links (`Up/Down`) or go Back/Forward (`Left/Right`). |
| `Enter`         | Follow the selected link.                        |
| `u`             | Go back to the previous page (Undo).             |
| `H` or `?`      | Show Help / Keyboard shortcuts.                  |
| `q`             | Quit the browser.                                |
| `/`             | Search for text on the current page.             |

## 3. Tool-Specific Commands

### lynx
- `lynx <url>`: Start lynx at a specific address.
- `o`: Open the **Options** menu to customize behavior.
- `v`: View the **Bookmarks** list.
- `a`: Add current page to bookmarks.

### w3m
- `w3m <url>`: Start w3m.
- `Shift-b`: Go back in history.
- `Shift-t`: Open a new **Tab**.
- `Shift-u`: Open a new URL.
- `Shift-m`: Toggle **Mouse support**.

### elinks
- `elinks <url>`: Start elinks.
- `g`: Go to URL.
- `t`: Open a new tab.
- `c`: Close the current tab.
- `Esc`: Open the **Top Menu bar**.

## 4. Configuration
Terminal browsers use configuration files in your home directory to store settings and bookmarks.

- **lynx:** `~/.lynxrc` and `/etc/lynx.cfg`.
- **w3m:** `~/.w3m/config`.
- **elinks:** `~/.elinks/elinks.conf`.

## 5. Pro Tips & Gotchas
- **Images in Terminal:** `w3m` can display images if you have `w3m-img` installed and are using a compatible terminal (like `xterm` or `kitty`).
- **JavaScript Support:** Most terminal browsers have **no JavaScript support**. This means modern complex web apps (like Gmail or Slack) will not work.
- **Privacy:** Text-based browsers are excellent for privacy as they don't load trackers, ads, or complex scripts by default.
- **Documentation:** Terminal browsers are perfect for reading online documentation or READMEs directly from the source while you code.
- **Slow Connections:** If you are on a very slow SSH connection, a terminal browser is much faster than tunneling a GUI browser.

---

## 🔗 See Also
- [Shell Basics](SHELL_GUIDE.md): Master the environment where these browsers live.
- [SSH & Networking](SSH_GUIDE.md): Use terminal browsers to test connectivity on remote servers.
- [htop Guide](HTOP_GUIDE.md): Monitor system resources while browsing.
