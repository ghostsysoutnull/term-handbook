# Java JDK Guide: Modern SDK Tools

A senior engineer's reference for Java development, focusing on the JDK's internal toolset, version management, and modern build systems.

## 0. Quick Start: Version Management
Never install the JDK via your OS package manager (`apt`, `brew`). It leads to "version hell" and permission issues. Use a dedicated manager.

| Tool     | Focus                                            | Key Command      |
| :------- | :----------------------------------------------- | :--------------- |
| **`sdkman!`**| **Recommended.** The specialized JVM manager.   | `sdk install java`|
| **`asdf / mise`**| Polyglot version management (Java + Node + Go). | `asdf install java`|

### Essential `sdkman!` Commands
- `sdk list java`: See all available JDK distributions (Corretto, Zulu, GraalVM).
- `sdk install java 21.0.2-tem`: Install a specific version.
- `sdk use java 21.0.2-tem`: Switch current shell to that version.
- `sdk default java 21.0.2-tem`: Set your global default.

## 1. Core Development Tools
| Tool           | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`javac`**    | Java Compiler: Converts `.java` to `.class`.     | `javac HelloWorld.java`                           |
| **`java`**     | Java Launcher: Runs applications or JAR files.   | `java HelloWorld` or `java -jar app.jar`          |
| **`javadoc`**  | Doc Generator: Creates HTML documentation.       | `javadoc -d docs src/*.java`                      |
| **`jar`**      | Archive Tool: Manages Java Archive (JAR) files.   | `jar -cvf app.jar *.class`                        |
| **`jshell`**   | REPL: Interactive Java shell (Read-Eval-Print).  | `jshell`                                          |

## 2. Build Systems (The "Package Managers")
In real-world projects, you rarely use `javac` directly. You use a build system to manage dependencies and lifecycle.

| Tool           | Focus                                            | CLI Command      |
| :------------- | :----------------------------------------------- | :--------------- |
| **`Maven`**    | Convention-over-configuration. Stable/Predictable.| `./mvnw clean install` |
| **`Gradle`**   | Speed and flexibility. Best for large monorepos. | `./gradlew build`|

### The "Wrapper" Rule
**ALWAYS** use the wrapper (`./mvnw` or `./gradlew`) included in your project. It ensures that every developer and CI server uses the exact same version of the build tool.

## 3. Packaging and Deployment
Modern JDKs focus on modularity and self-contained applications.

| Tool           | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`jlink`**    | Custom Runtime: Creates a minimal JVM for app.   | `jlink --module-path $MODS --add-modules my.app`  |
| **`jpackage`** | Native Installer: Creates `.deb`, `.rpm`, `.msi`.| `jpackage --name MyApp --input . --main-jar a.jar`|
| **`jmod`**     | Module Creator: Creates JMOD files for jlink.    | `jmod create --class-path . mymodule.jmod`        |

## 4. Monitoring and Diagnostics
Essential for "Battle Stories" involving performance tuning or memory leaks.

| Tool           | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`jcmd`**     | Diagnostic Command: Sends requests to a JVM.     | `jcmd <pid> VM.uptime`                            |
| **`jps`**      | Process Status: Lists all running Java PIDs.     | `jps -l`                                          |
| **`jmap`**     | Memory Map: Prints memory maps or heap dumps.    | `jmap -dump:format=b,file=heap.bin <pid>`         |
| **`jstack`**   | Stack Trace: Prints stack traces of threads.     | `jstack <pid> > threads.txt`                      |
| **`jstat`**    | Statistics: Monitors JVM performance (GC, heap). | `jstat -gc <pid> 1000 10`                         |

## 5. Pro Tips & Gotchas
- **SDKMAN! is Life:** If your `JAVA_HOME` is messed up, `sdkman!` will fix it automatically.
- **Single-File Execution:** Since Java 11, you can run a source file directly without compiling: `java HelloWorld.java`.
- **Heap Dumps:** If a Java app crashes with `OutOfMemoryError`, use `jmap` to see what's eating memory.
- **jcmd is King:** `jcmd` is the recommended "one-stop-shop" for almost all diagnostic tasks, replacing older tools like `jinfo`.
- **Corepack for Java:** While Java doesn't have "Corepack," using wrappers (`mvnw`/`gradlew`) provides the same "version locking" benefit.

---

## 🔗 See Also
- [Package Managers](../terminal/PACKAGE_MANAGERS_GUIDE.md): Comparing OS-level and language-level managers.
- [Node.js Guide](NODEJS_GUIDE.md): Modern terminal workflows for the JS ecosystem.
- [Makefile Automation](../development/MAKEFILE_GUIDE.md): Automate your `javac` and `jar` workflows.
- [htop Guide](../terminal/HTOP_GUIDE.md): Monitor the system impact of high-load Java processes.
