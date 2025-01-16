Roku Screenshot Utility
======
Automates capturing screenshots from a Roku device via AppleScript.

This script prompts for a Roku IP address, triggers a screenshot (dev.jpg) using the Roku developer portal, downloads the image to your Mac’s Downloads folder, and opens the folder automatically.

Features
======
	•	IP Prompt: Enter your Roku device’s IP address (default: 192.168.0.109).
	•	Developer Credentials: Uses default credentials (rokudev:rokudev).
	•	Automatic File Saving: Downloads the dev.jpg screenshot to your Mac’s Downloads folder.
	•	Debugging Optional: Includes debug dialogs (commented out for simplicity).
	•	Convenience: Opens the Downloads folder once the process is complete.


How to Use
======
	1.	Open the script in Script Editor (or run it via osascript).
	2.	Enter your Roku IP address when prompted.
	3.	The script captures and downloads the screenshot, saving it as RokuIP_Timestamp.jpg in the Downloads folder.
	4.	The Downloads folder opens automatically for easy access.
