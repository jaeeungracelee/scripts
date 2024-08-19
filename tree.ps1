# to print the entire file structure just type tree /F 
function Print-Tree {
    param (
        [string]$dir,
        [string]$prefix = ''
    )

    # subdirs and matching files
    $items = Get-ChildItem -Path $dir
    $dirs = $items | Where-Object { $_.PSIsContainer }
    $files = $items | Where-Object { -not $_.PSIsContainer -and $_.Name -like '*______insert whatever you want to find here______*' }

    # print files
    foreach ($file in $files) {
        Write-Output "$prefix│   $($file.Name)"
    }

    # print dirs and recurse yay
    foreach ($dirItem in $dirs) {
        Write-Output "$prefix├───$($dirItem.Name)"
        Print-Tree -dir $dirItem.FullName -prefix "$prefix│   "
    }
}

# set root
$rootDir = Get-Location

# run function starting at the root
Print-Tree -dir $rootDir
