# Compression Utilities Guide: Archiving and Zipping

A quick reference for the standard programs used to archive and compress files and directories in the terminal.

## 1. The Classic: `tar` (Tape Archive)
`tar` is the most common tool for bundling multiple files into a single archive.

| Command                | Action                                           |
| :--------------------- | :----------------------------------------------- |
| `tar -cvf archive.tar dir/` | **Create** a new archive.                   |
| `tar -xvf archive.tar` | **Extract** an archive.                          |
| `tar -tvf archive.tar` | **List** the contents of an archive.             |
| `tar -zcvf archive.tar.gz dir/` | Create a **compressed** (gzip) archive.  |
| `tar -zxvf archive.tar.gz` | Extract a compressed (gzip) archive.         |

### Common Flags:
- `-c`: Create.
- `-x`: Extract.
- `-v`: Verbose (show progress).
- `-f`: File (specify the archive name).
- `-z`: Gzip compression.
- `-j`: Bzip2 compression.

## 2. Standard Compression: `gzip` and `bzip2`
These tools compress single files.

| Tool      | Command                | Description                                      |
| :-------- | :--------------------- | :----------------------------------------------- |
| **`gzip`**| `gzip file.txt`        | Compresses file to `file.txt.gz`.                |
| **`gunzip`**| `gunzip file.txt.gz` | Decompresses the file.                           |
| **`bzip2`**| `bzip2 file.txt`      | Higher compression than gzip, but slower.        |
| **`bunzip2`**| `bunzip2 file.txt.bz2`| Decompresses the file.                           |

## 3. Cross-Platform: `zip` and `unzip`
Commonly used for compatibility with Windows.

| Command                | Action                                           |
| :--------------------- | :----------------------------------------------- |
| `zip archive.zip file1 file2` | Create a zip archive.                     |
| `zip -r archive.zip dir/` | Create a recursive zip of a directory.        |
| `unzip archive.zip`    | Extract a zip archive.                           |
| `unzip -l archive.zip` | List contents of a zip file.                     |

## 4. Modern Performance: `zstd` and `xz`
| Tool      | Key Feature                                      | Example                                           |
| :-------- | :----------------------------------------------- | :------------------------------------------------ |
| **`zstd`**| Extremely fast compression/decompression.        | `zstd file.txt`                                   |
| **`xz`**  | Best compression ratio (slowest).                | `xz -9 file.txt`                                  |

## 5. Pro Tips & Gotchas
- **`tar` doesn't compress by default:** A `.tar` file is just a bundle of files. Use the `-z` (gzip) or `-j` (bzip2) flags to actually shrink the size.
- **Directory Extraction:** Use `-C <dir>` with `tar` to extract into a specific folder: `tar -xvf data.tar.gz -C ./target_dir`.
- **Archive Size:** Use `du -sh archive.tar.gz` to check the size of your compressed file.
- **Progress Bars:** If you have massive archives, use the `pv` (Pipe Viewer) tool to see a real-time progress bar: `pv archive.tar.gz | tar -xz`.

---

## 🔗 See Also
- [Core Utilities Guide](CORE_UTILITIES.md): Master `cp` and `mv` for moving archives.
- [Shell Basics](SHELL_GUIDE.md): Understand the pipes used for high-performance compression.
- [Makefile Guide](../development/MAKEFILE_GUIDE.md): Automate your backup and release archiving.
