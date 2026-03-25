# Java JDK Guide: Modern SDK Tools

A quick reference for the essential programs found in the `bin` folder of a modern Java Development Kit (JDK 21+).

## 1. Core Development Tools
| Tool           | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`javac`**    | Java Compiler: Converts `.java` to `.class`.     | `javac HelloWorld.java`                           |
| **`java`**     | Java Launcher: Runs applications or JAR files.   | `java HelloWorld` or `java -jar app.jar`          |
| **`javadoc`**  | Doc Generator: Creates HTML documentation.       | `javadoc -d docs src/*.java`                      |
| **`jar`**      | Archive Tool: Manages Java Archive (JAR) files.   | `jar -cvf app.jar *.class`                        |
| **`jshell`**   | REPL: Interactive Java shell (Read-Eval-Print).  | `jshell` (starts an interactive session)          |

## 2. Packaging and Deployment
Modern JDKs focus on modularity and self-contained applications.

| Tool           | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`jlink`**    | Custom Runtime: Creates a minimal JVM for app.   | `jlink --module-path $MODS --add-modules my.app`  |
| **`jpackage`** | Native Installer: Creates `.deb`, `.rpm`, `.msi`.| `jpackage --name MyApp --input . --main-jar a.jar`|
| **`jmod`**     | Module Creator: Creates JMOD files for jlink.    | `jmod create --class-path . mymodule.jmod`        |

## 3. Monitoring and Diagnostics
Essential for "Battle Stories" involving performance tuning or memory leaks.

| Tool           | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`jcmd`**     | Diagnostic Command: Sends requests to a JVM.     | `jcmd <pid> VM.uptime`                            |
| **`jps`**      | Process Status: Lists all running Java PIDs.     | `jps -l`                                          |
| **`jmap`**     | Memory Map: Prints memory maps or heap dumps.    | `jmap -dump:format=b,file=heap.bin <pid>`         |
| **`jstack`**   | Stack Trace: Prints stack traces of threads.     | `jstack <pid> > threads.txt`                      |
| **`jstat`**    | Statistics: Monitors JVM performance (GC, heap). | `jstat -gc <pid> 1000 10`                         |
| **`jfr`**      | Flight Recorder: Parses/analyzes JFR recordings. | `jfr print recording.jfr`                         |

## 4. Security and Utilities
| Tool           | Description                                      | Example                                           |
| :------------- | :----------------------------------------------- | :------------------------------------------------ |
| **`keytool`**  | Keystore Manager: Manages keys and certificates. | `keytool -genkeypair -alias mykey`                |
| **`jdb`**      | Debugger: Command-line debugger for Java.        | `jdb MyClass`                                     |
| **`jdeps`**    | Dependency Analyzer: Analyzes class dependencies.| `jdeps -s myapp.jar`                              |

## 5. Configuration
Java environment is primarily configured via environment variables.

- **`JAVA_HOME`**: Points to the root directory of the JDK installation.
- **`PATH`**: Should include `$JAVA_HOME/bin` to run tools from anywhere.
- **`CLASSPATH`**: Tells the JVM where to look for user-defined classes/libraries.

## 6. Pro Tips & Gotchas
- **Single-File Execution:** Since Java 11, you can run a source file directly without compiling: `java HelloWorld.java`.
- **Heap Dumps:** If a Java app crashes with `OutOfMemoryError`, use `jmap` to see what's eating the memory.
- **Module Path vs Classpath:** Modern Java (9+) uses `--module-path` for modular code, though `-classpath` is still supported for legacy apps.
- **jcmd is King:** `jcmd` is the recommended "one-stop-shop" for almost all diagnostic tasks, replacing older tools like `jinfo`.

---

## 🔗 See Also
- [Docker Essentials](DOCKER_GUIDE.md): Perfect for containerizing Java applications.
- [Makefile Automation](MAKEFILE_GUIDE.md): Automate your `javac` and `jar` workflows.
- [htop Guide](../terminal/HTOP_GUIDE.md): Monitor the system impact of high-load Java processes.
