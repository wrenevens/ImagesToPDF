function cimpdf {
    param (
        [string]$Format = "png"
    )

    # Ensure the format starts with a dot
    if ($Format -notmatch "^\.") {
        $Format = ".$Format"
    }

    # Get image files of the desired format in the current directory
    $imageFiles = Get-ChildItem . -Filter "*$Format" | Sort-Object Name

    if ($imageFiles.Count -eq 0) {
        Write-Host "(!Error!) No files with extension $Format found in this folder." -ForegroundColor Yellow
        return
    }

    # Get the current folder path
    $currentPath = (Get-Location).Path

    # Generate a random ID for output file
    $hashRandom = Get-Random -Maximum 7777777

    # Generate a timestamp-based string
    $dateString = (Get-Date).ToString()
    $result = "dHpdF"
    foreach ($ch in $dateString.ToCharArray()) {
        if ($ch -ge '0' -and $ch -le '9') {
            $result += $ch
        }
    }

    # Define output PDF path
    $outputPdf = "$currentPath\$hashRandom-$result.pdf"

    # Wrap file paths in quotes to handle spaces
    $fileList = $imageFiles | ForEach-Object { '"' + $_.FullName + '"' }

    # Build ImageMagick command
    $command = "magick convert $($fileList -join ' ') `"$outputPdf`""

    # Execute the command
    Invoke-Expression $command

    Write-Host "(Completed) Converted images into PDF: $outputPdf" -ForegroundColor Green
}
