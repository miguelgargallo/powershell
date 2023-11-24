Get-ChildItem -Directory | ForEach-Object { 
    $folder = $_
    $size = (Get-ChildItem $folder.FullName -Recurse | Measure-Object -Property Length -Sum).Sum / 1MB
    [PSCustomObject]@{
        FolderName = $folder.Name
        SizeMB = [math]::Round($size, 2)
    }
} | Format-Table -AutoSize
