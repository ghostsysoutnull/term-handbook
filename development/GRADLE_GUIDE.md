# Gradle Guide: High-Performance Builds

Gradle is a powerful, flexible build automation tool primarily used in the JVM ecosystem. Unlike Maven's fixed lifecycle, Gradle is task-based and optimized for speed.

## 1. Task-Based Architecture
Everything in Gradle is a **Task**. You can list and inspect them directly from the CLI.

| Command                     | Purpose                                           |
| :-------------------------- | :------------------------------------------------ |
| `./gradlew tasks`           | List main "useful" tasks.                         |
| `./gradlew tasks --all`     | List all tasks, including internal ones.          |
| `./gradlew help --task <T>` | Show details and options for task `T`.            |
| `./gradlew <T> -x <skip>`   | Run task `T` but exclude task `skip`.             |
| `./gradlew <T> --rerun`     | Force run a task even if it's "UP-TO-DATE".       |

### Common Lifecycle Tasks
- `./gradlew assemble`: Compile and package code (e.g., create JAR).
- `./gradlew check`: Run all verification tasks (Unit/Integration tests, linting).
- `./gradlew build`: Equivalent to `assemble` + `check`.
- `./gradlew clean`: Delete the `build` directory.

## 2. Dependency Insight
Gradle provides surgical tools to investigate dependency graphs and version conflicts.

- **`./gradlew dependencies`**: Visualizes all dependencies.
  - *Tip:* Use `--configuration runtimeClasspath` to filter the output.
- **`./gradlew dependencyInsight --dependency <name>`**: Explains *why* a specific version of a library was selected and who requested it.
- **`./gradlew buildEnvironment`**: Inspect dependencies of the build script itself (plugins, etc.).

## 3. Performance Tuning (The "Speed" Flags)
Gradle is designed for speed. Use these flags to drastically reduce build times.

| Flag                     | Action                                              |
| :----------------------- | :-------------------------------------------------- |
| `--parallel`             | Run independent modules/projects in parallel.       |
| `--build-cache`          | Reuse outputs from previous builds (even from CI).  |
| `--configuration-cache`  | Caches the configuration phase for faster startups. |
| `--daemon`               | (Default) Keep a background process alive for speed.|
| `--no-daemon`            | Disables the daemon (recommended for one-off CI).   |

**Combined for maximum speed:**
```bash
./gradlew build --parallel --build-cache --configuration-cache
```

## 4. Advanced Execution Modes
- **Continuous Mode (`-t`):** Automatically re-runs tasks whenever a source file changes.
  - *Example:* `./gradlew test -t` (Live testing).
- **Build Scan (`--scan`):** Generates a comprehensive web-based report of your build’s performance and dependencies.
- **Dry Run (`-m`):** Shows which tasks *would* run without executing them.

## 5. Dependency Scopes (The Rosetta Stone)
Gradle's scopes are more granular than Maven's.

| Scope              | Usage                                               |
| :----------------- | :-------------------------------------------------- |
| `implementation`   | Internal dependency (not exposed to consumers).      |
| `api`              | Transitive dependency (exposed to consumers).       |
| `compileOnly`      | Needed for compilation but not at runtime (e.g., Lombok).|
| `runtimeOnly`      | Needed at runtime but not for compilation (e.g., Driver).|
| `testImplementation`| Only used for tests.                               |

## 6. Pro Tips & Gotchas
- **The Wrapper Rule:** Always use `./gradlew` instead of a global `gradle` install. This ensures version consistency across the team.
- **Stop the Daemon:** If your RAM is low, use `./gradlew --stop` to kill all background Gradle processes.
- **Profile Your Build:** Use `--profile` to generate an HTML report in `build/reports/profile/` to find slow tasks.
- **Project Structure:** In multi-module projects, use `:module-name:task-name` to run a task on a specific sub-project.

---

## 🔗 See Also
- [Maven Guide](MAVEN_GUIDE.md): Compare Gradle with the convention-based alternative.
- [Java JDK Guide](../languages/JAVA_JDK_GUIDE.md): Understanding the JVM environment Gradle runs in.
- [htop Guide](../terminal/HTOP_GUIDE.md): Monitor RAM and CPU usage of the Gradle Daemon.
