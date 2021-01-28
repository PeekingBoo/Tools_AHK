; YOU ONLY NEED TO CHANGE THE CODE BETWEEN THE ARROWS FOR BASIC FUNCTIONALITY, LOOK FOR THIS: VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
; SCRIPT IS ACTIVATED BY USING SCROLL LOCK, SEE THE END OF THIS FILE

; Give your script a custom icon, just create one and reference its filepath below, then remove the semi-colon on the left beside 'Menu'
; Menu, Tray, Icon, C:\scriptIcon.ico



; Parameters
#NoEnv				; Prevents variables from being looked up as Environmental Variables
#InstallKeybdHook
#UseHook On
#SingleInstance, Force		; Prevents additional instances of this script from opening
setbatchlines, -1		; Sets script to run at max speed

; Variables
scriptActive := false		; Indicates whether the script should run or not - this is set false so that it needs to be manually activated
waitTime := 50			; Time value used to pause the script, the value represents the number of milliseconds



; Create a Loop that runs everything we need forever
Loop {
	; Perform a pause for the specified waitTime in ms so that the script isn't running unnecessarily frequently
	sleep %waitTime%
	
	; Perform a check to see if the script is active
	if(scriptActive) {
		; If it is active, call a function to set the parameters of the specified window
		
		
		
		
		
		
		
		
		; VVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVVV
		
		; NOTE: Windows OS can sometimes be finicky about what makes up a Window's name - eg Notepad will show "Untitled - Notepad" but only "Untitled" is required
		; Make a new line for each Window you wish to affect
		; Parameters are: [WindowName, X, Y, Width, Height] - Mark a field with "" if it is to remain unchanged
		setWindowParameters("Untitled", 500, 500, 640, 480)
		setWindowParameters("Untitled2", 0, 20, "", "")
		
		; ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
		
		
		
		
		
		
		
	}
}



; Finds the current state of a specified window and then resizes  + repositions it to the desired coordinates
; Parameters: [  Window Name  |  X  |  Y  |  Width  |  Height  ] - Can be left blank with a "" to indicate no change
setWindowParameters(winName, toX, toY, toW, toH) {
	
	; Checks if a window of the specified name exists - NOTE: Be careful with using common names like "Settings" because it will target every one
	if WinExist(winName) {
		; Retrieves the current parameters of the window if it's found
		WinGetPos, fromX, fromY, fromW, fromH
		
		; Performs a simple check to see if any of the 4 parameters are mismatched
		if(((fromX != toX) and (toX != "")) or ((fromY != toY) and (toY != "")) or ((fromW != toW) and (toW != "")) or ((fromH != toH) and (toH != ""))) {
			; If any of the window parameters differ from the requirements, the window is repositioned - WinMove ignores "".
			WinMove, %winName%,, toX, toY, toW, toH
		}
	}
}



; Finally, let's set up a hotkey to activate the script, Scroll Lock works well because it puts a light on your keyboard when it's running.
~ScrollLock::
	if(scriptActive) {
		scriptActive := false
	} else {
		scriptActive := true
	}
return
