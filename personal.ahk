﻿; Shortcuts implemented in this script
;
; [Windows Key + n] Notepad++
; [Windows Key + z] Downloads folder
; [Windows Key + s] Shipment form and Shipped folder
; [Windows Key + l] Loan agreements folder
; [Windows Key + p] US Sales Plan
; [Windows Key + a] Ticket large attachment archive folder
; [Windows Key + i] BOM description from clipboard
; [Windows Key + q] Import folder of multi-tiff data into iQ
;

;----------------------------------------------------------------------
; [Windows Key + n] Notepad++
;----------------------------------------------------------------------
#n::Run Notepad++

;----------------------------------------------------------------------
; [Windows Key + z] Downloads folder
;----------------------------------------------------------------------
#z::Run %A_MyDocuments%\Downloads

;----------------------------------------------------------------------
; [Windows Key + s] Shipment form and Shipped folder
;----------------------------------------------------------------------
#s::
Run \\ct-dc-01\home\Shipment Request Forms - completed
Run \\balrog\msystems\ISO 9001 - Quality\FORMS\FM US SHIPMENT REQUEST FORM.doc
return

;----------------------------------------------------------------------
; [Windows Key + l] Loan agreements folder
;----------------------------------------------------------------------
#l::Run \\ct-dc-01\home\Man Pack List & Loan Agreements\2012 LOAN AGREEMENTS

;----------------------------------------------------------------------
; [Windows Key + p] US Sales Plan
;----------------------------------------------------------------------
#p::Run \\ct-dc-01\home\Common\Sales Plan\U.S. Sales Plan.xls

;----------------------------------------------------------------------
; [Windows Key + a] Ticket large attachment archive folder
;----------------------------------------------------------------------
#a::Run \\balrog\dataExchange\Product Support\SLX Removed from Ticket

;----------------------------------------------------------------------
; [Windows Key + i] BOM description from clipboard
;----------------------------------------------------------------------
#i::
description = ; clear variable
MyLabel:
Send ^c
; break repeat loop if nothing new copied
if clipboard = %description%
  return

Run http://intranet/bomreport/
WinWait, Shamrock Components,,20
if ErrorLevel
  return

; Select product code 
WinActivate
while (A_Cursor = "AppStarting")
  continue

; Display detail view
Send {tab}%clipboard%{tab}{Enter}
Sleep,1000
while (A_Cursor = "AppStarting")
  continue

; View source
Send {tab}{AppsKey}
Send {Down 10}{Enter}
Sleep,100
while (A_Cursor = "AppStarting")
  continue

Send {tab}^a^c
Sleep,100 ; Wait for clipboard to process
begin := RegExMatch(clipboard, "<h3>(.*)</h3>", raw_description)
StringMid, description, raw_description, 5, StrLen(raw_description) - 9
if begin != 0
{
  clipboard = %description%
  Send ^w!{tab}
  Sleep,100 ; Wait for Word to be active
  Send {tab}^v
}
else
{
  MsgBox RegEx failed: begin = %begin%
  return
}
Send {tab 2}
Goto, MyLabel

;----------------------------------------------------------------------
; [Windows Key + q] Import folder of multi-tiff data into iQ
;----------------------------------------------------------------------
#q::
FileSelectFolder, Folder
Folder := RegExReplace(Folder, "\\$")  ; Removes the trailing backslash
if Folder =
{
  return  ; No folder selected
}
else
{
  total_images = 0
  ; Count the number of images to generate the progress bar
  Loop, %Folder%\*.tif
  {
    total_images := total_images + 1
  }
  ;MsgBox, DEBUG: *.TIF image(s) found in directory: %i%
  if total_images > 0
  {
    active_image = 1
    Progress, m h100 w800 c0 cbBlue, Entering folder, %active_image% of %total_images%: %A_LoopFileName%, Opening TIF image in iQ
    Loop, %Folder%\*.tif
    {
      bar_percent := active_image * 100 / total_images
      Progress, %bar_percent%, Looking for Andor iQ window, %active_image% of %total_images%: %A_LoopFileName%
      SetTitleMatchMode, 1
      WinWait, Andor iQ,,1
      if not ErrorLevel
      {
        WinActivate
        Progress,, Selecting file to open
        Send !f{Enter}
        WinWait, Open File,,3
        clipboard = %A_LoopFileLongPath%
        Send ^v!o
        WinWait, Load File,,3
        While not ErrorLevel
        {
          Progress,, Waiting for "Load File" to complete
          WinWaitClose, Load File,,1
          if not ErrorLevel
          {
            active_image := active_image + 1
          }
          WinWait, Load File,,1
        }
		; handle Image Disk Warning "Disk is xx% Full!"
        WinWait, Image Disk Warning,,1
        if not ErrorLevel
        {
          WinActivate
		  Send {Enter}
        }
      }
      else
      {
        Progress, Off
        return
      }
    }
    Progress, Off
  }
  else
    MsgBox, No *.TIF images found inside %Folder%
  return
}