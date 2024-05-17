try {
    # Path to the main script
    $scriptPath = "C:\Users\John PC\Desktop\Scripts\MoveFiles.ps1"  # Replace with the actual path to MoveFiles.ps1

    # Create a scheduled task action to run the script
    $action = New-ScheduledTaskAction -Execute 'Powershell.exe' -Argument "-NoProfile -ExecutionPolicy Bypass -File `"$scriptPath`""

    # Create a trigger to run the task at startup
    $trigger = New-ScheduledTaskTrigger -AtStartup

    # Create a scheduled task principal to run the task with the highest privileges
    $principal = New-ScheduledTaskPrincipal -UserId "SYSTEM" -LogonType ServiceAccount -RunLevel Highest

    # Register the scheduled task
    Register-ScheduledTask -TaskName "MoveDownloadedFiles" -Action $action -Trigger $trigger -Principal $principal

    Write-Host "Scheduled task created successfully."
} catch {
    Write-Error "Failed to create scheduled task. $_"
}