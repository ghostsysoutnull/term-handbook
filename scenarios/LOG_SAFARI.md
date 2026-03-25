# Scenario: The 2 AM Log Safari

**The Crisis:** It's 2:14 AM. The production payment gateway is throwing intermittent 500 errors. The dashboard shows a spike in failures, but the automated alerts don't specify which user or endpoint is the culprit. You have access to a 15GB log file named `production_access.log`.

## 1. The Investigation: Finding the Pattern
First, we need to see what these 500 errors look like. Standard `grep` is too slow for 15GB, so we reach for `ripgrep` (`rg`).

```bash
# Find the first 10 occurrences of 500 errors to see the structure
rg "HTTP/1.1\" 500" production_access.log | head -n 10
```

We notice the 5th column is the Request ID and the 8th column is the User Agent. We suspect a specific crawler might be hitting a heavy endpoint.

## 2. The Extraction: Isolating the Culprit
We want to see which User Agents are associated with these 500 errors. We use `awk` to extract the column and `sort | uniq -c` to count them.

```bash
# Extract user agent (col 8), count occurrences, and sort by highest
rg "HTTP/1.1\" 500" production_access.log | awk '{print $8}' | sort | uniq -c | sort -nr | head -n 5
```

The output shows 4,500 hits from `AggressiveBot/v2.1`.

## 3. The Solution: Forensic Data Cleaning
Now we need to find all unique IP addresses used by this bot to block them at the firewall. We use `rg` to find the bot, `awk` to get the IP (col 1), and `sed` to format the IPs for a blocklist script.

```bash
# Get unique IPs, and format them as 'deny IP;' for an Nginx config
rg "AggressiveBot/v2.1" production_access.log | awk '{print $1}' | sort -u | sed 's/^/deny /; s/$/;/' > blocklist.conf
```

## 4. The Aftermath
By piping `rg` into `awk` and then `sed`, we processed gigabytes of data in seconds. We didn't just find the error; we generated a configuration file that stopped the attack.

### Senior Engineer's Retrospective
- **Tool Choice:** `rg` was chosen for its speed on large files.
- **Precision:** `awk` handled the structured columns perfectly.
- **Automation:** `sed` turned raw data into a deployable artifact (the Nginx config).
- **Lesson:** Always log with structure (like Request IDs) so you can track a failure across the entire pipeline.

---

## 🔗 Related Guides
- [ripgrep (Power User Toolkit)](../terminal/POWER_USER_TOOLKIT.md)
- [awk Guide](../development/AWK_GUIDE.md)
- [sed Guide](../development/SED_GUIDE.md)
