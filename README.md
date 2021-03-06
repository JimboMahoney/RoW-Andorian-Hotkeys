Make repetitive work awesome! (RoW Edition)
===========================================
<img src="https://cloud.github.com/downloads/omsai/andorian-hotkeys/andorian-scripts-banner.png"
 alt="hot-scripts logo" title="Happy Andorian" align="right" />

Automate your computer to save cumulative hours of your life a year,
and watch your mundane work do itself.

Autohotkey is a powerful scripting language that sends keystrokes,
runs programs and processes information for repetitive tasks (for example, looking up SOs; Tickets and RMAs).

Batteries are (mostly) included: these scripts ask for your information and
save it to an ini file, so no code editing is required to get running.

NOTE - This is a fork from Pariksheet's (GitHub name Omsai) original work - I've simplified it so that I can maintain it for the RoW Team.

LIMITATIONS - Due to different users having different layouts for WIP Tracking, Win + M may require user-specific customisation.


Usage
-----------

`⊞ Win`+`?` shows the hotkeys active in this script

`⊞ Win`+`B` Open BOM (Bill of Materials) for part code (highlighted selection or copied to clipboard)

`⊞ Win`+`I` Open SalesLogix System / Installation ticket from SLX Account (copied to clipboard)

`⊞ Win`+`M` Launch WIP RMA database (automatic login) and optionally opens RMA (copied to clipboard)

`⊞ Win`+`N` Opens a text editor - either Emacs, Notepad++ or Notepad

`⊞ Win`+`O` Find Sales Order from SO number or serial number (highlighted selection or copied to clipboard)

`⊞ Win`+`S` Find ship date from Sales Order (highlighted selection or copied to clipboard)

`⊞ Win`+`T` Open SalesLogix ticket from clipboard or Outlook e-mail title

`⊞ Win`+`V` Paste an SLX comment template for updating Tickets (Name, Date, Summary, Original E-mail)

`⊞ Win`+`X` Find SLX Tickets from Sales Order (copied to clipboard)

`⊞ Win`+`Z` Bugzilla search (highlighted selection or copied to clipboard)

Suggestions should be posted as issues here => https://github.com/JimboMahoney/RoW-Andorian-Hotkeys/issues



Installation
------------
*Google Chrome* is recommended, since it is used for development and testing.
Please report any issues you may encounter with other browsers.

1.  Install <a href="http://ahkscript.org/" target="_blank">Autohotkey</a> (Big blue Download button on top right).

2.  Install <a href="http://windows.github.com/" target="_blank">GitHub for Windows</a>

3.  Register for a GitHub account <a href="https://github.com/join" target="_blank">here</a>
	
4.	Run GitHub for Windows (in the Start Menu) and log in to your GitHub account. Patience is required here, as it takes a long time (30 seconds?) to load...
    After login, enter your e-mail and name for Git.

5.  Login to your GitHub account on <a href="https://github.com/JimboMahoney/RoW-Andorian-Hotkeys" target="_blank">this</a> webpage and 
    [clone this repository](github-windows://openRepo/https://github.com/JimboMahoney/RoW-Andorian-Hotkeys), choosing a sensible directory on your machine and remembering where you save it!

6.  Have the script startup automatically in Windows by
    making a shortcut to `main.ahk` (in the GitHub, Andorian Hotkeys directory) in your Windows start menu > Startup folder


Create your own hotkeys
-----------------------
In the same directory as main.ahk, create your ahk file and edit
[main.ahk](RoW-Andorian-Hotkeys/blob/master/main.ahk#L18) to `#Include` it


Contribute
----------
<a href="https://github.com/JimboMahoney/RoW-Andorian-Hotkeys/issues" target="_blank">Code and feature requests welcome!</a>


