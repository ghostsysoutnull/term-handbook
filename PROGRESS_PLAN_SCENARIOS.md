# Project Plan: Tool Scenarios (Battle Stories)

A collection of fictional but realistic scenarios demonstrating how to combine terminal tools to solve complex problems.

## Scenario Roadmap

| Status | Story Title                | Tools Featured                    | Description                                      |
| :----- | :------------------------- | :-------------------------------- | :----------------------------------------------- |
| ✅     | The 2 AM Log Safari        | `rg`, `awk`, `sed`, `sort`        | `scenarios/LOG_SAFARI.md`                        |
| ✅     | The Firewall Wall          | `ssh`, `-L`, `-R`, `config`       | `scenarios/FIREWALL_WALL.md`                     |
| ✅     | The Merge Conflict from Hell| `git`, `vim` (splits/diff), `stash`| `scenarios/MERGE_CONFLICT.md`                    |
| ✅     | The Nomad Coder            | `git` (bare repo), `zsh`, `stow`  | `scenarios/NOMAD_CODER.md`                       |
| 📅     | The Zombie Process Hunter  | `htop`, `ps`, `kill`, `lsof`      | Debugging ghost resource leaks on production.   |

## Standards for Scenarios
- **Narrative-Driven:** Start with a crisis or a specific goal.
- **Interoperability:** Focus on how tools work together in pipes.
- **Code Blocks:** Provide the exact commands used in the "Solution" phase.
- **Lesson Learned:** End with a "Senior Engineer's Retrospective."
