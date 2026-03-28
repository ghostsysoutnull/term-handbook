# Maven Guide: Terminal Build Mastery

Apache Maven is the industry-standard build automation tool for Java. This guide focuses on terminal-based efficiency, dependency debugging, and advanced build techniques.

## 1. The Build Lifecycle
Maven follows a strict sequence of phases. Invoking a phase runs all preceding phases in that lifecycle.

| Phase      | Purpose                                           | When to use it                                  |
| :--------- | :------------------------------------------------ | :---------------------------------------------- |
| `clean`    | Deletes the `target` directory.                   | Before every fresh build to avoid stale cache.  |
| `compile`  | Compiles source code to `.class` files.           | Quick check for syntax errors.                  |
| `test`     | Runs unit tests (JUnit/TestNG).                   | Validating your logic before packaging.         |
| **`package`** | Bundles code into a `.jar` or `.war`.             | **Standard workflow.** Creates the artifact.    |
| **`verify`**  | Runs integration tests.                           | **Best for CI/CD.** Ensures code is ready.      |
| `install`  | Puts the artifact into your local `~/.m2` repo.   | When other local projects depend on this one.   |
| `deploy`   | Pushes the artifact to a remote repo (Nexus/Artifactory). | Final release step.                             |

## 2. Dependency Intelligence
Use these commands to debug "Jar Hell" and optimize your `pom.xml`.

- **`mvn dependency:tree`**: Visualizes the full hierarchy. Use `-Dincludes=...` to find specific artifacts.
- **`mvn dependency:analyze`**: Finds used-but-undeclared dependencies (transitive risks) and unused-but-declared (bloat).
- **`mvn dependency:purge-local-repository`**: Cleans and re-downloads dependencies for the project. Fixes corrupted downloads.

## 3. Profiles and Properties
Tailor your build for different environments without changing the code.

- **Activate a Profile:** `mvn package -Pprod`
- **Pass a System Property:** `mvn install -DskipTests`
- **Pass a Variable:** `mvn spring-boot:run -Dspring.profiles.active=dev`
- **View Effective POM:** `mvn help:effective-pom` (Shows the "final" XML after all inheritance and profiles are applied).

## 4. Multi-Module Power User Tips
- **Build a specific module:** `mvn install -pl :module-name -am`
  - `-pl` (project list): Only build this module.
  - `-am` (also make): Build all dependencies needed by this module.
- **Resume a failed build:** `mvn install -rf :failed-module`
  - `-rf` (resume from): Restarts the build from the point of failure.

## 5. Performance Tweaks
Make your builds faster in the terminal.

- **Parallel Builds:** `mvn -T 1C clean install`
  - `-T 1C`: Uses 1 thread per CPU core.
- **Offline Mode:** `mvn install -o`
  - `-o`: Skips remote repository checks; uses local `~/.m2` cache only.
- **Incremental Builds:** Ensure you aren't running `clean` every time if you only changed one file.

## 6. Pro Tips & Gotchas
- **The Wrapper Rule:** Always use `./mvnw` instead of `mvn`. This ensures everyone uses the same Maven version.
- **Snapshot Updates:** If a dependency isn't updating, force it with `mvn clean install -U`.
- **The `.m2` Folder:** Located at `~/.m2/repository`. If space is low, it's safe to delete, but Maven will have to re-download everything next time.
- **Settings:** Global configuration (mirrors, credentials) lives in `~/.m2/settings.xml`.

---

## 🔗 See Also
- [Java JDK Guide](JAVA_JDK_GUIDE.md): Understanding the underlying compiler and diagnostics.
- [Package Managers](../terminal/PACKAGE_MANAGERS_GUIDE.md): How Maven fits into the broader ecosystem.
- [Makefile Automation](MAKEFILE_GUIDE.md): Using Make to wrap complex Maven commands.
- [htop Guide](../terminal/HTOP_GUIDE.md): Monitoring CPU impact during parallel builds.
