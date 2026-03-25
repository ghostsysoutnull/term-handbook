# Scenario: The Firewall Wall

**The Crisis:** You've just joined a high-security fintech project. You need to investigate a data discrepancy in the `InternalDB`, but there's a problem: the database is in a private subnet. The only way in is through a "Jump Host" (bastion) that only accepts SSH connections. You need to use your local GUI database tool (like DBeaver or TablePlus) to run queries, but the database port (5432) is blocked from the outside world.

## 1. The Investigation: Mapping the Path
The security team gives you the following details:
- **Jump Host:** `jump.secure-fintech.com` (User: `bpfurtado`)
- **Internal DB Host:** `10.0.1.45` (Port: `5432`)

You try to connect directly, but as expected, the connection times out.

## 2. The Solution: Local Port Forwarding
You decide to create an SSH tunnel. You want to map a port on your **local** machine (e.g., 8888) to the **remote** database port (5432) *through* the jump host.

```bash
# Create the tunnel
ssh -L 8888:10.0.1.45:5432 bpfurtado@jump.secure-fintech.com
```

Now, you open your GUI tool and connect to `localhost:8888`. Success! The traffic is securely encrypted and "tunneled" through the jump host.

## 3. The Refinement: Automating the Tunnel
Typing that long command every time is tedious. You decide to use your `~/.ssh/config` to make this a one-word command.

```text
# Add this to ~/.ssh/config
Host internal-db
    HostName jump.secure-fintech.com
    User bpfurtado
    LocalForward 8888 10.0.1.45:5432
```

Now, you simply run:
```bash
ssh -N internal-db
```
*(The `-N` flag tells SSH not to execute a remote command, just keep the tunnel open).*

## 4. The Aftermath: Reverse Tunneling (The Bonus)
A colleague needs to see a demo of a web app running on your **local** machine (port 3000), but they are on the remote jump host. You use a **Reverse Tunnel** to share your local port with them.

```bash
# Share your local port 3000 to the remote jump host's port 9000
ssh -R 9000:localhost:3000 bpfurtado@jump.secure-fintech.com
```
Now your colleague can visit `localhost:9000` on the jump host and see your local app!

### Senior Engineer's Retrospective
- **Tool Choice:** `ssh -L` is the standard for accessing "hidden" internal services.
- **Efficiency:** Using `~/.ssh/config` turns a complex networking task into a simple, reusable alias.
- **Safety:** Tunnels are safer than opening ports on a public firewall because they rely on existing, audited SSH access.
- **Lesson:** Think of SSH not just as a terminal, but as a "secure pipe" for any kind of data.

---

## 🔗 Related Guides
- [SSH & Networking Guide](../terminal/SSH_GUIDE.md)
- [Shell Basics](../terminal/SHELL_GUIDE.md)
- [Dotfiles Management](../development/DOTFILES_GUIDE.md)
