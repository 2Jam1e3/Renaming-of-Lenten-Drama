$basePath = "D:\Operation\2026\Holy Week\Lenten Drama\Genesis\Part"

for ($i = 1; $i -le 11; $i++) {

    $chapterPath = Join-Path $basePath "$i\Chapter"

    if (Test-Path $chapterPath) {

        Get-ChildItem -Path $chapterPath -Filter "*.mp4" | ForEach-Object {

            # Extract A/B/C from filename
            if ($_.Name -match "([ABC])\.mp4$") {
                $letter = $matches[1]
            }
            else {
                Write-Host "Skipped (can't detect A/B/C): $($_.Name)"
                return
            }

            # Force correct format
            $newName = "Genesis - Part $i - Chapter $letter.mp4"

            Rename-Item -LiteralPath $_.FullName -NewName $newName -Force
        }
    }
}
