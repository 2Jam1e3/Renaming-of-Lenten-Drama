# 🎬 Rename Videos — PowerShell Script

A PowerShell utility for batch-renaming video files into a clean, consistent naming convention. Originally built for organizing a multi-part Lenten Drama series (Genesis), but easily adaptable for any similarly structured video library.

---

## 📋 What It Does

The script scans through a structured folder hierarchy and renames `.mp4` files from whatever their current filename is into a standardized format:

```
Genesis - Part {number} - Chapter {letter}.mp4
```

**Example:**

| Before | After |
|---|---|
| `A.mp4` | `Genesis - Part 1 - Chapter A.mp4` |
| `B.mp4` | `Genesis - Part 3 - Chapter B.mp4` |
| `C.mp4` | `Genesis - Part 7 - Chapter C.mp4` |

---

## 🗂️ Expected Folder Structure

The script expects files to be organized in the following layout:

```
D:\Operation\2026\Holy Week\Lenten Drama\Genesis\
├── Part 1\
│   └── Chapter\
│       ├── A.mp4
│       ├── B.mp4
│       └── C.mp4
├── Part 2\
│   └── Chapter\
│       └── ...
└── Part 11\
    └── Chapter\
        └── ...
```

> The script iterates over **Parts 1 through 11** automatically.

---

## ⚙️ Configuration

At the top of the script, update the `$basePath` variable to match your local directory:

```powershell
$basePath = "D:\Operation\2026\Holy Week\Lenten Drama\Genesis\Part"
```

Change this to wherever your video files are stored before running.

---

## 🚀 Usage

1. **Open PowerShell** (Windows PowerShell or PowerShell 7+).
2. Navigate to the folder containing the script, or provide its full path.
3. Run the script:

```powershell
.\rename_videos.ps1
```

> If you encounter an execution policy error, you can temporarily allow the script to run with:
> ```powershell
> Set-ExecutionPolicy -Scope Process -ExecutionPolicy Bypass
> .\rename_videos.ps1
> ```

---

## ⚠️ Notes & Behavior

- Only `.mp4` files are processed — other file types are ignored.
- Only files ending in `A.mp4`, `B.mp4`, or `C.mp4` will be renamed. Any file that doesn't match this pattern will be **skipped**, and a warning will be printed:
  ```
  Skipped (can't detect A/B/C): filename.mp4
  ```
- If a Part folder does not exist, it is silently skipped.
- Renaming is done **in place** — no files are moved or copied.
- The `-Force` flag will overwrite an existing file if the target name already exists, so make sure there are no naming conflicts before running.

---

## 🛠️ Requirements

- Windows OS
- Windows PowerShell 5.1+ or PowerShell 7+
- Read/write access to the target directory

---

## 📁 Adapting for Other Projects

To repurpose this script for a different series or naming convention, update:

| Variable / Line | What to Change |
|---|---|
| `$basePath` | Root path to your video folders |
| `$i -le 11` | Upper bound for the number of parts |
| `([ABC])` | Regex pattern to match your chapter identifiers |
| `"Genesis - Part $i - Chapter $letter.mp4"` | Output filename format |
