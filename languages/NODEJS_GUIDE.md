# Node.js Guide: Modern Terminal Workflow

A senior engineer's reference for Node.js development, focusing on performance, reproducible environments, and modern tooling.

## 1. Version Management
Never install Node.js via `sudo apt` or the global system installer. Use a version manager to switch between projects seamlessly without permission issues.

| Tool     | Tech      | Focus                                            |
| :------- | :-------- | :----------------------------------------------- |
| **`fnm`**| Rust      | **Recommended.** Near-instant shell startup and execution. |
| **`nvm`**| Shell     | The industry standard, but can be slow on startup. |
| **`volta`**| Rust    | "Pin" versions per-project; works seamlessly across teams. |

### Essential `fnm` Commands
- `fnm list-remote`: List available Node.js versions.
- `fnm install <version>`: Download and install a version.
- `fnm use <version>`: Switch the current shell's Node version.
- `fnm default <version>`: Set the global default.

## 2. Package Managers
Node.js has evolved beyond `npm`. Modern managers focus on disk efficiency and speed.

| Manager | Best For                                         | Key Command      |
| :------ | :----------------------------------------------- | :--------------- |
| **`pnpm`** | **Standard.** Disk-efficient via hard links and strict logic. | `pnpm install`   |
| **`bun`**  | **Speed.** All-in-one runtime, test runner, and manager. | `bun install`    |
| **`npm`**  | **Legacy.** The default, slower but always available. | `npm install`    |

### The `Corepack` Power Move
Node.js 16.13+ includes **Corepack**, which manages `pnpm` and `yarn` automatically based on your `package.json`.
```bash
corepack enable # Run once to stop manually installing pnpm/yarn
```

## 3. Project Essentials
Master the terminal interface to your project.

### `package.json` Scripts
Define common tasks in your `package.json` to keep workflows consistent:
- `npm run dev`: Start development mode (often with hot-reloading).
- `npm run build`: Compile for production.
- `npm test`: Run the test suite.

### `npx` and `pnpm dlx` (One-off Commands)
Run a CLI tool without installing it globally or locally.
- `npx <pkg>`: Fetches and executes a package.
- `pnpm dlx <pkg>`: The faster, safer `pnpm` equivalent.
- **Example:** `npx cowsay "Hello"` or `npx shadcn-ui@latest init`.

## 4. Advanced Terminal Workflow
- **Native `.env` Support:** Node.js 20+ now supports environment files natively.
  - Usage: `node --env-file=.env index.js` (no `dotenv` package needed).
- **Instant TypeScript:** Use `tsx` for high-performance execution of `.ts` files.
  - Usage: `npx tsx script.ts`.
- **Watching for Changes:** Use the native `--watch` flag in Node.js 18+.
  - Usage: `node --watch index.js`.

## 5. Pro Tips & Gotchas
- **The `node_modules` Black Hole:** Use **`npkill`** to find and delete large `node_modules` folders to reclaim disk space.
  - Usage: `npx npkill`.
- **Avoid `sudo npm install -g`:** If you need `sudo` for global installs, your setup is broken. Use `fnm` or `nvm` to fix permissions.
- **Lockfiles Matter:** Always commit `package-lock.json`, `pnpm-lock.yaml`, or `bun.lockb` to ensure reproducible builds.
- **Global Binaries:** Find where your global tools are located:
  - `npm config get prefix`
  - `pnpm config get store-dir`

---

## 🔗 See Also
- [Package Managers](../terminal/PACKAGE_MANAGERS_GUIDE.md): Comparison of OS-level and language-level managers.
- [Docker Essentials](../development/DOCKER_GUIDE.md): Containerizing Node.js applications for production.
- [GitHub CLI](../development/GH_GUIDE.md): Automating Node.js project management on GitHub.
