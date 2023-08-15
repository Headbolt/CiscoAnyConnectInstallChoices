#!/bin/bash
#
###############################################################################################################################################
#
# ABOUT THIS PROGRAM
#
#	CiscoAnyConnectInstallChoices.sh
#	https://github.com/Headbolt/CiscoAnyConnectInstallChoices
#
#   This Script is designed for use in JAMF and was designed to create a choices file for Cisco AnyConnect Install
#	BEFORE the installer is cached, so it can be referenced in an install command after the caching.
#
#	The Following Variables should be defined
#	Variable 4 - Named "Choice File Name - eg. anyconnect_choices.xml"
#	Variable 5 - Named "Install Choices - eg. 1 0 1 0 0 0 0 0"
#	Variable 6 - Named "INFO - Choices are : vpn fireamp dart posture iseposture nvm umbrella. ALL must have a value, seperated by a SPACE"
#
###############################################################################################################################################
#
# HISTORY
#
#   Version: 1.0 - 15/08/2023
#
#	15/08/2023 - V1.0 - Created by Headbolt
#
###############################################################################################################################################
#
#   DEFINE VARIABLES & READ IN PARAMETERS
#
###############################################################################################################################################
#
ChoiceFileName=$4 # Grab the Download Choice File Name from JAMF variable #4 eg. anyconnect_choices.xml
InstallChoices=$5 # Grab the Install Choices from JAMF variable #5 eg. 1 0 1 0 0 0 0 0
#
vpnEnabled=$( /bin/echo $InstallChoices | awk '{print $1}' ) # Split vpninstall choice out from the string in the InstallChoices Variable
fireampEnabled=$( /bin/echo $InstallChoices | awk '{print $2}' ) # Split fireampinstall choice out from the string in the InstallChoices Variable
dartEnabled=$( /bin/echo $InstallChoices | awk '{print $3}' ) # Split dartinstall choice out from the string in the InstallChoices Variable
postureEnabled=$( /bin/echo $InstallChoices | awk '{print $4}' ) # Split postureinstall choice out from the string in the InstallChoices Variable
isepostureEnabled=$( /bin/echo $InstallChoices | awk '{print $5}' ) # Split isepostureinstall choice out from the string in the InstallChoices Variable
nvmEnabled=$( /bin/echo $InstallChoices | awk '{print $6}' ) # Split nvminstall choice out from the string in the InstallChoices Variable
umbrellaEnabled=$( /bin/echo $InstallChoices | awk '{print $7}' ) # Split umbrellainstall choice out from the string in the InstallChoices Variable
#
WaitingRoomFolder="/Library/Application Support/JAMF/Waiting Room"
ScriptName="Application | Cisco AnyConnect | Choice File"
ExitCode=0
#
###############################################################################################################################################
#
#   Checking and Setting Variables Complete
#
###############################################################################################################################################
# 
# SCRIPT CONTENTS - DO NOT MODIFY BELOW THIS LINE
#
###############################################################################################################################################
#
# Defining Functions
#
###############################################################################################################################################
#
# Variable Check Function
#
VarCheck(){
#
/bin/echo 'Checking "'$Var2Check'" is set correctly'
#
if [[ "$VarValue" != "" ]]
	then
		if [[ "$VarValue" == "0" ]]
			then
				/bin/echo 'Value for "'$Var2Check'" is "'$VarValue'"'
				/bin/echo 'This Value Is Acceptable'
				/bin/echo 'Script will Contine'
		fi
		#
		if [[ "$VarValue" == "1" ]]
			then
				/bin/echo 'Value for "'$Var2Check'" is "'$VarValue'"'
				/bin/echo 'This Value Is Acceptable'
				/bin/echo 'Script will Contine'
		fi
	else
		/bin/echo 'Value for "'$Var2Check'" is "'$VarValue'"'
    	/bin/echo '"'$Var2Check'" MUST have a Value'
		/bin/echo 'Cannot Contine, ending script'
		ExitCode=1
		SectionEnd
		ScriptEnd
fi
#
}
#
###############################################################################################################################################
#
# ChoiceFile Function
#
ReWriteChoiceFile(){
#
/bin/echo 'Rewriting Choice File "'"$WaitingRoomFolder"/"$ChoiceFileName"'"'
#
/bin/echo '<?xml version="1.0" encoding="UTF-8"?>' > "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '<plist version="1.0">' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '<array>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	<dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>attributeSetting</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<integer>'$vpnEnabled'</integer>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceAttribute</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>selected</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceIdentifier</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>choice_vpn</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	</dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	<dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>attributeSetting</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<integer>'$fireampEnabled'</integer>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceAttribute</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>selected</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceIdentifier</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>choice_fireamp</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	</dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	<dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>attributeSetting</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<integer>'$dartEnabled'</integer>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceAttribute</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>selected</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceIdentifier</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>choice_dart</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	</dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	<dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>attributeSetting</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<integer>'$postureEnabled'</integer>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceAttribute</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>selected</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceIdentifier</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>choice_posture</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	</dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	<dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>attributeSetting</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<integer>'$isepostureEnabled'</integer>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceAttribute</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>selected</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceIdentifier</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>choice_iseposture</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	</dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	<dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>attributeSetting</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<integer>'$nvmEnabled'</integer>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceAttribute</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>selected</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceIdentifier</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>choice_nvm</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	</dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	<dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>attributeSetting</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<integer>'$umbrellaEnabled'</integer>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceAttribute</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>selected</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<key>choiceIdentifier</key>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '		<string>choice_umbrella</string>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '	</dict>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '</array>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
/bin/echo '</plist>' >> "$WaitingRoomFolder"/"$ChoiceFileName"
#
}
#
###############################################################################################################################################
#
# Section End Function
#
SectionEnd(){
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
}
#
###############################################################################################################################################
#
# Script End Function
#
ScriptEnd(){
#
/bin/echo Ending Script '"'$ScriptName'"'
/bin/echo # Outputting a Blank Line for Reporting Purposes
/bin/echo  ----------------------------------------------- # Outputting a Dotted Line for Reporting Purposes
/bin/echo # Outputting a Blank Line for Reporting Purposes
#
exit $ExitCode
#
}
#
###############################################################################################################################################
#
# End Of Function Definition
#
###############################################################################################################################################
# 
# Begin Processing
#
###############################################################################################################################################
#
/bin/echo # Outputting a Blank Line for Reporting Purposes
SectionEnd
#
Var2Check='vpnEnabled'
VarValue=$vpnEnabled
VarCheck
SectionEnd
#
Var2Check='fireampEnabled'
VarValue=$fireampEnabled
VarCheck
SectionEnd
#
Var2Check='dartEnabled'
VarValue=$dartEnabled
VarCheck
SectionEnd
#
Var2Check='postureEnabled'
VarValue=$postureEnabled
VarCheck
SectionEnd
#
Var2Check='isepostureEnabled'
VarValue=$isepostureEnabled
VarCheck
SectionEnd
#
Var2Check='nvmEnabled'
VarValue=$nvmEnabled
VarCheck
SectionEnd
#
Var2Check='umbrellaEnabled'
VarValue=$umbrellaEnabled
VarCheck
SectionEnd
#
ReWriteChoiceFile
SectionEnd
ScriptEnd
