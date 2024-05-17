# Log function to write messages to a log file
$logFile = "C:\Users\John PC\Desktop\Scripts\MoveFilesLog.txt"
function Log {
    param ([string]$message)
    Add-Content -Path $logFile -Value "$(Get-Date -Format "yyyy-MM-dd HH:mm:ss") - $message"
}

Log "Script started."

# Define the action to take when a file is created
$action = {
    Log "Action triggered."

    # Specify the source folder where downloaded files are located
    $sourceFolder = "C:\Users\John PC\Downloads"

    # Specify the destination folders for different file types
    $extractionDestination = "C:\Users\John PC\Desktop\Extraction"
    $documentDestination = "C:\Users\John PC\Documents"
    $imageDestination = "C:\Users\John PC\Desktop\Downloaded PNG's"
    $svgDestination = "C:\Users\John PC\Desktop\Downloaded PNG's\SVG's Converted"
    $musicDestination = "C:\Users\John PC\Desktop\Music"
    $videoDestination = "C:\Users\John PC\Videos"

    # List of file extensions to be moved to their respective folders
    $imageExtensions = "*.png", "*.jpg", "*.jpeg", "*.gif", "*.bmp"
    $svgExtensions = "*.svg"
    $documentExtensions = "*.doc*", "*.pdf", "*.txt", "*.xlsx", "*.ppt*", "*.csv"
    $archiveExtensions = "*.zip", "*.rar", "*.7z"
    $musicExtensions = "*.mp3"
    $videoExtensions = "*.mp4","*.mov","*.avi","*.wmv","*.mkv","*.webm"

    # Move files based on extension
    function Move-Files {
        param (
            [string]$sourceFolder,
            [array]$extensions,
            [string]$destination
        )
        foreach ($extension in $extensions) {
            Log "Moving $extension files to $destination."
            Move-Item -Path "$sourceFolder\$extension" -Destination $destination -Force -ErrorAction SilentlyContinue
        }
    }

    # Move image files
    Move-Files -sourceFolder $sourceFolder -extensions $imageExtensions -destination $imageDestination

    # Move SVG files
    Move-Files -sourceFolder $sourceFolder -extensions $svgExtensions -destination $svgDestination

    # Move document files
    Move-Files -sourceFolder $sourceFolder -extensions $documentExtensions -destination $documentDestination

    # Move archive files
    Move-Files -sourceFolder $sourceFolder -extensions $archiveExtensions -destination $extractionDestination

    # Move music files
    Move-Files -sourceFolder $sourceFolder -extensions $musicExtensions -destination $musicDestination

    # Move video files
    Move-Files -sourceFolder $sourceFolder -extensions $videoExtensions -destination $videoDestination

    Log "Action completed."
}

# Create a file system watcher to monitor the Downloads folder
$watcher = New-Object System.IO.FileSystemWatcher
$watcher.Path = "C:\Users\John PC\Downloads"
$watcher.Filter = "*.*"
$watcher.NotifyFilter = [System.IO.NotifyFilters]'FileName, LastWrite'
$watcher.IncludeSubdirectories = $false
$watcher.EnableRaisingEvents = $true

# Register an event handler for the Created event
Register-ObjectEvent -InputObject $watcher -EventName Created -Action $action

Log "File system watcher started."

# Keep the script running
while ($true) {
    Start-Sleep -Seconds 10
}
