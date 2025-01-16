-- AppleScript: Roku Screenshot Utility
-- Asks only for IP. Username/Password = "rokudev"
-- Saves to Downloads folder, shows debug dialogs, opens Downloads at the end.

try
	-- Default IP address prompt
	set defaultIP to "192.168.0.109"
	
	-- Ask user for the Roku IP address
	set rokuIP to text returned of (display dialog ¬
		"Enter Roku IP Address:" default answer defaultIP)
	
	-- Hard-coded Roku Dev username & password
	set rokuUser to "rokudev"
	set rokuPass to "rokudev"
	
	-- Generate a timestamp
	set currentTime to do shell script "date +%m%d_%H_%M_%S"
	
	-- Construct the path for the screenshot in the Downloads folder
	set downloadsFolder to (path to downloads folder)
	set downloadsPath to POSIX path of downloadsFolder
	set screenshotPath to downloadsPath & rokuIP & "_" & currentTime & ".jpg"
	
	-- Construct URLs
	set captureURL to "http://" & rokuIP & "/plugin_inspect"
	set downloadURL to "http://" & rokuIP & "/pkgs/dev.jpg"
	
	-- Debug dialog: show URL for POST request
	-- display dialog "Sending POST to capture screenshot:" & captureURL
	
	-- STEP 1: Send POST request to trigger screenshot capture
	do shell script "curl --digest -u " & rokuUser & ":" & rokuPass & " -F 'mysubmit=Screenshot' -F 'archive=' -F 'passwd=' " & captureURL
	
	-- Debug dialog: show URL for GET request
	-- display dialog "Downloading dev.jpg from:" & downloadURL
	
	-- STEP 2: Download dev.jpg
	do shell script "curl --digest -u " & rokuUser & ":" & rokuPass & space & downloadURL & " -o " & quoted form of screenshotPath
	
	-- STEP 3: Open the Downloads folder
	tell application "Finder"
		open downloadsFolder
		activate
	end tell
	
on error errMsg
	display dialog "Error: " & errMsg buttons {"OK"} default button 1
end try
