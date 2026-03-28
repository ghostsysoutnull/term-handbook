# Maven vs. Gradle: The JVM Build Rosetta Stone

Choosing between Maven and Gradle is a strategic decision. This guide provides a side-by-side comparison to help you translate your knowledge and select the right tool for your project.

## 1. The Philosophy Shootout
| Feature | Apache Maven | Gradle |
| :--- | :--- | :--- |
| **Philosophy** | **Convention over Configuration.** Rigid and predictable. | **Power through Flexibility.** Task-based and scriptable. |
| **Configuration** | Declarative XML (`pom.xml`). | DSL-based (`build.gradle`) in Groovy or Kotlin. |
| **Lifecycle** | Linear: `compile` -> `test` -> `package`. | Directed Acyclic Graph (DAG) of Tasks. |
| **Performance** | Sequential (mostly). Improved in 4.x. | High-performance: Incremental, Parallel, Cached. |

## 2. Rosetta Stone: Command Equivalents
| Action | Maven (`mvn`) | Gradle (`gradlew`) |
| :--- | :--- | :--- |
| **Clean Build** | `mvn clean install` | `./gradlew clean build` |
| **Compile Only** | `mvn compile` | `./gradlew classes` |
| **Run Tests** | `mvn test` | `./gradlew test` |
| **Skip Tests** | `-DskipTests` | `-x test` |
| **Dependency Tree** | `mvn dependency:tree` | `./gradlew dependencies` |
| **Run App** | `mvn exec:java -Dexec.mainClass="..."` | `./gradlew run` |
| **Parallel Build** | `mvn -T 1C ...` | Enabled by default (or `--parallel`) |
| **Offline Mode** | `mvn -o ...` | `./gradlew --offline` |

## 3. Dependency Scope Translation
Gradle is more granular, allowing you to hide internal dependencies from consumers for faster builds.

| Maven Scope | Gradle Configuration | Best For |
| :--- | :--- | :--- |
| `compile` | `api` | Transitive dependency (leaks to consumers). |
| `compile` | `implementation` | **Recommended.** Internal dependency (hidden). |
| `provided` | `compileOnly` | Needed for compile, provided at runtime (Servlet API). |
| `runtime` | `runtimeOnly` | Not needed for compile (JDBC Driver). |
| `test` | `testImplementation` | Only used for test compilation and execution. |

## 4. Key Architectural Differences
### Phases vs. Tasks
- **Maven** uses a fixed, linear pipeline. You can't run `package` without running `test` (unless you explicitly skip it).
- **Gradle** uses a graph of tasks. If you run a task, Gradle only executes the specific tasks it depends on. This allows for **Task Avoidance**—if inputs haven't changed, the task is skipped (`UP-TO-DATE`).

### Customization
- **Maven** logic is locked into **Plugins**. If you need custom behavior, you must find a plugin or write your own in Java.
- **Gradle** allows you to write custom logic directly in your `build.gradle` file using standard code.

## 5. Final Verdict: When to Use What
| Use Maven if... | Use Gradle if... |
| :--- | :--- |
| You want a "standard" build that every Java dev understands instantly. | You have a large multi-module project where build speed is a bottleneck. |
| You prefer stable, verbose XML over "magic" scripts. | You are building for **Android** (it is the industry standard). |
| You have a simple monolith or microservice with standard needs. | You need custom build logic or polyglot builds (e.g., Java + Node). |

---

## 🔗 See Also
- [Maven Guide](MAVEN_GUIDE.md): Deep dive into lifecycle and dependency trees.
- [Gradle Guide](GRADLE_GUIDE.md): Master task graphs and performance flags.
- [Java JDK Guide](../languages/JAVA_JDK_GUIDE.md): The underlying compiler and runtime used by both.
- [Screen vs. tmux](../terminal/SCREEN_VS_TMUX.md): Another "Rosetta Stone" guide for terminal multiplexers.
