$path = "insert whatever file path here"

$files = Get-ChildItem -Path $path -Recurse -Filter "*whatever you need to find*.extension here"

foreach ($file in $files) {
    Write-Output $file.FullName
}

# open!
foreach ($file in $files) {
    Start-Process $file.FullName
}
