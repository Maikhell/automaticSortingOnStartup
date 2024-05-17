# AutomaticSortingOnStartup By John Michael Camara

## Introduction
This script enables users to **automatically sort downloaded files** based on their file types every time they download something in their browser. The script **runs on startup and continuously operates in the background**. It is executed using Windows PowerShell, providing a seamless and efficient way to organize downloaded files without manual intervention.

### Pros
- Run Continuously On One Time Manual Activation
- Sorting Files Much Easier
### Cons
- Limited File Extensions
 (But can be resolved by editing the "MoveFile.ps1" file and adding more file extensions)
 > You can always add more extension files that fits your needs!

## Step-by-Step Guide: Setting up Automatic File Sorting

### Before You Begin: 
Download my Files First and Extract it in your specified folder

### Open and Modify "MoveFiles.ps1":
- Open the **"MoveFiles.ps1"** script.
- Adjust all paths to match your system. This includes variables like $logFile, $documentDestination, etc. Replace them with your own paths.

### Do the Same for "SetupScheduleTask.ps1":
- Open **"SetupScheduleTask.ps1"**.
- Locate the line $scriptPath = "Your own path".
- Replace "Your own path" with your actual script path.

# Step 1: Open PowerShell as Administrator
- Search for **"PowerShell"** in the Start Menu.
- Right-click on "Windows PowerShell" and select **"Run as administrator"**.
# Step 2: Navigate to the Script Files
- In PowerShell, change directory to where your script files are located.
- Use the   ```cd``` command with single quotation marks around the path.
- For example:  ```cd 'C:\Users\YourUsernamePc\LocationFiles\Scripts'```
# Step 3: Run the Setup Script
- Execute the setup script by copying and pasting the following command into PowerShell:
-   ```.\SetupScheduleTask.ps1'```
# Step 4: Verify Setup Completion
- After running the script, you should see an output similar to this:
``` 
TaskPath           TaskName                State
--------           --------                -----
\                  MoveDownloadedFiles     Ready
Scheduled task created successfully.****
```
# Step 5: Check Task Scheduler
- Press ```Windows + R,``` then type ```taskschd.msc``` and press Enter.
- In the left panel, navigate to **"Task Scheduler Library"** and click once to expand it.
- In the Middle Panel Scroll down to find the task named **"MoveDownloadedFiles"**.
- Right-click on the task, then click **"Properties"**.

# Step 6: Configure Task Properties
### General Tab:
- Ensure **"Run with highest privileges"** is checked.
- Select **"Run whether user is logged on or not"**.
### Trigger Tab:
- Verify there is a trigger set to run the task at startup.
### Actions Tab:
- Confirm the action is set to run ```powershell.exe``` with the correct arguments to execute your ```MoveFiles.ps1``` script.
# Step 7: Run the Task
- Go back to the **MoveDownloadedFiles** and select **Run**
# Final Step: Test the Setup
- Download some files and check if they are sorted correctly.
