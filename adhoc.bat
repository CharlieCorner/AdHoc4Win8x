@echo off
cls
echo[
echo *******************************************************
echo             AdHoc Setup for Windows 8.1           
echo                  by: Carlos H. Rincon
echo *******************************************************
echo This will execute the necessary commands to bring easy AdHoc setup support back to Windows 8.x
echo Really Microsoft? Are you jesting?
echo ---
echo[

:MENU
echo Please choose an option:
echo 1. Setup a new shared network.
echo 2. Start a previously created network.
echo 3. Stop a shared network
echo 4. Show the status of the Hosted Network
echo 5. Show the Hosted Network password
echo 6. Exit
set /p menuchoice=:

IF "%menuchoice%"=="1" GOTO SETUP
IF "%menuchoice%"=="2" GOTO START_NETWORK
IF "%menuchoice%"=="3" GOTO STOP_NETWORK
IF "%menuchoice%"=="4" GOTO SHOW_DETAILS
IF "%menuchoice%"=="5" GOTO SHOW_PASS
IF "%menuchoice%"=="6" GOTO END

echo Invalid choice, please try again...
GOTO MENU


:SETUP
echo Setting up!

set /p ssid=Enter SSID: 
set /p passkey=Enter the password you want configured for this network: 
echo --
REM This prints a blank line
echo[

echo netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%passkey%
echo netsh wlan start hostednetwork

echo[

netsh wlan set hostednetwork mode=allow ssid=%ssid% key=%passkey%
netsh wlan start hostednetwork
echo[
echo Don't forget to head over to Network and Sharing Center
echo  select the connection that has an internet connection
echo  click on the Properties button and on the Sharing tab
echo  check the Allow other network users to connect option
echo  and select the newly created connection from the dropdown!
GOTO END

:START_NETWORK
echo Starting network!
echo[
echo netsh wlan start hostednetwork
echo[
netsh wlan start hostednetwork
GOTO END


:STOP_NETWORK
echo Stopping network!
echo[
echo netsh wlan stop hostednetwork
echo[
netsh wlan stop hostednetwork
GOTO END

:SHOW_DETAILS
echo Showing details!
echo[
echo netsh wlan show hostednetwork
echo[
netsh wlan show hostednetwork
GOTO END

:SHOW_PASS
echo Showing the password SHH!
echo[
echo netsh wlan show hostednetwork setting=security
echo[
netsh wlan show hostednetwork setting=security
GOTO END


:END
echo[
set /p=Hit ENTER to continue...
echo Exiting...