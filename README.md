# ImagesToPDF
This is a PowerShell script that can help convert images in any format to PDF file.

## How to Use

### A) Set Execution Policy for Current User Scope
PowerShell does not allow script execution by default. Run the following command in PowerShell:

```powershell
Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
```

- This will permanently allow digitally signed scripts to run.
- To revert this change:

```powershell
Set-ExecutionPolicy Undefined -Scope CurrentUser
```

### B) Download ImageMagick
The script uses ImageMagick to convert images to PDF.

1. Visit [ImageMagick](https://imagemagick.org)
2. Click on "Download"
3. Choose "Windows Binary Release"
4. Download and install the latest version

### C) Create $PROFILE and Add Script
To add the script to your PowerShell profile:

1. Open PowerShell (Win + X)
2. Run:

```powershell
notepad $PROFILE
```

If an error occurs, run:

```powershell
New-Item -Path $PROFILE -ItemType File -Force
notepad $PROFILE
```

If error still occurs, run:
```powershell
$PROFILE
```
Then copy the address, and go to that. If can't visit, then move to previous location and create new folders has the same name.

3. Copy and paste the contents of `sourceCode.ps1` into the notepad and save the file.

### D) Run the Script

1. Open File Explorer and navigate to the folder containing your images.
   - All images must be in the same directory.
2. Press `ALT + F + R + ENTER` to open PowerShell in the current directory.
3. Run the command:

```powershell
cimpdf -format "[your_images_format]"
```

#### Examples

- To convert JPG images:

```powershell
cimpdf -format "jpg"
```

- To convert PNG images (default format):

```powershell
cimpdf
```

> The default format is "png". You can change this by modifying the `$Format` value in `sourceCode.ps1`.

---

## Troubleshooting

If you encounter any errors during setup or usage, feel free to ask **ChatGPT** for assistance!

> ChatGPT-inspired mini-project

