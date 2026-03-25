# SSH & Networking Guide: Secure Remote Access

A quick reference for connecting to remote servers, managing SSH keys, and basic network troubleshooting.

## 1. Connecting to Remote Servers
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `ssh user@host`        | Connect to a remote host as a specific user.     |
| `ssh -p <port> user@host`| Connect using a specific port (default is 22). |
| `exit`                 | Close the current SSH session.                   |
| `scp <src> user@host:<dest>` | Securely copy a file to a remote host.     |
| `sftp user@host`       | Start an interactive secure file transfer session.|

## 2. SSH Key Management
SSH keys provide a more secure way of logging in than using passwords.

| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `ssh-keygen -t ed25519`| Generate a new, secure SSH key (recommended).    |
| `ssh-copy-id user@host`| Copy your public key to a remote host for passwordless login. |
| `ssh-add ~/.ssh/id_ext`| Add a specific key to your SSH agent.            |
| `ls -l ~/.ssh`         | List your existing keys and configuration.       |

## 3. Port Forwarding (Tunnels)
| Type       | Command                               | Description                                      |
| :--------- | :------------------------------------ | :----------------------------------------------- |
| **Local**  | `ssh -L 8080:localhost:80 user@host`  | Forward local port 8080 to remote port 80.       |
| **Remote** | `ssh -R 8080:localhost:80 user@host`  | Forward remote port 8080 to local port 80.       |
| **Dynamic**| `ssh -D 1080 user@host`               | Create a SOCKS proxy on local port 1080.         |

## 4. Basic Networking Commands
| Command                | Description                                      |
| :--------------------- | :----------------------------------------------- |
| `ping <host>`          | Check connectivity to a remote host.             |
| `curl -I <url>`        | Fetch the HTTP headers of a URL.                 |
| `ip addr`              | Show your local IP addresses.                    |
| `netstat -tunlp`       | List all active listening ports and processes.   |
| `dig <domain>`         | Perform a DNS lookup for a domain.               |

## 5. Configuration
You can simplify your SSH connections by using a config file.

- **File Location:** `~/.ssh/config`
- **Example Entry:**
  ```text
  Host myserver
      HostName 192.168.1.100
      User bpfurtado
      Port 2222
      IdentityFile ~/.ssh/id_ed25519
  ```
- **Usage:** Now you can just run `ssh myserver`.

## 6. Pro Tips & Gotchas
- **Permissions Matter:** SSH is strict. Ensure your `~/.ssh` directory is `700` and your private keys are `600` (`chmod 600 ~/.ssh/id_rsa`).
- **Keep-Alive:** If your connection drops frequently, add `ServerAliveInterval 60` to your config.
- **Agent Forwarding:** Use `ssh -A user@host` to pass your local SSH keys to the remote server (use with caution!).
- **SSH Escape Sequences:** If a session freezes, type `~.` (tilde followed by a dot) to force-kill the connection.

---

## 🔗 See Also
- [Shell Basics](SHELL_GUIDE.md): Essential commands for remote terminal use.
- [tmux](TMUX_GUIDE.md): Keep your remote sessions running if you disconnect.
