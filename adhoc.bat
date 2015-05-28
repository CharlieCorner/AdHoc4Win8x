@echo off
echo[
echo *******************************************************
echo             AdHoc Setup for Windows 8.1           
echo                  by: Carlos H. Rincon
echo *******************************************************
echo This will execute the necessary commands to bring easy AdHoc setup back to Windows 8.x
echo Really Microsoft?
echo ---
echo[

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

set /p=Hit ENTER to continue...
