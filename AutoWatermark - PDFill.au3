#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <ButtonConstants.au3>
#include <EditConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <GuiEdit.au3>
#include <GUIConstants.au3>
#include <FileConstants.au3>
#include <MsgBoxConstants.au3>
#include <Array.au3>
#include <File.au3>
;#include <DDEML.au3>         ;<= load down from examples
;#include <DDEMLClient.au3>   ;<= load down from examples

#Region ### START Koda GUI section ### Form=
Global $Form1_1 = GUICreate("Form1", 674, 181, 725, 155)
Global $txt1 = GUICtrlCreateInput("", 80, 88, 369, 22)
Global $Watermark = GUICtrlCreateLabel("Watermark", 16, 88, 56, 18)
Global $Footer = GUICtrlCreateLabel("Footer", 32, 59, 35, 18)
Global $txt2 = GUICtrlCreateInput("", 80, 59, 369, 22)
Global $Enable = GUICtrlCreateCheckbox("Footer", 216, 32, 57, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $Enable1 = GUICtrlCreateCheckbox("Watermark", 120, 32, 73, 17)
GUICtrlSetState(-1, $GUI_CHECKED)
Global $Label1 = GUICtrlCreateLabel("AUTOMATED WATERMARKING FROM PDFill", 168, 8, 240, 25)
Global $Button2 = GUICtrlCreateButton("Enter", 464, 56, 155, 97)
Global $txt3 = GUICtrlCreateInput("", 72, 144, 153, 22)
Global $txt4 = GUICtrlCreateInput("", 264, 144, 185, 22)
Global $Label2 = GUICtrlCreateLabel("From", 16, 144, 56, 18)
Global $Label3 = GUICtrlCreateLabel("To", 240, 144, 24, 18)
Global $Label4 = GUICtrlCreateLabel("Split pages from PDF using PDFill", 144, 120, 208, 18)
Global $Enable2 = GUICtrlCreateCheckbox("Split pages", 280, 32, 73, 17)
Global $Browse = GUICtrlCreateButton("Browse", 504, 16, 75, 25)

;Global $txt5 = GUICtrlCreateInput("", 72, 8, 168, 22)
;Global $Label5 = GUICtrlCreateLabel("PDFill Path", 16, 8, 53, 18)


GUICtrlSetState(-1, $GUI_CHECKED)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

Global $signoutstate = 0;

; 1) Browse Files

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Browse
			Global $FileSelected = FileOpenDialog  ("Hold down Ctrl or Shift to choose multiple files", @WindowsDir & "\", "All (*.*)", $FD_MULTISELECT)
			If @error Then
                MsgBox(4096, "", "No File(s) chosen")
            Else
                $FileSelected = StringReplace($FileSelected, "|", @CRLF)
                MsgBox(4096, "", "You chose " & $FileSelected)
            EndIf

	EndSwitch

; 2) The reason we put many copy of the same If function is because the arrange ment is giving a certain pattern at how it can happen, with this, this will give all allow all patterns

	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch

	; Creating New Folder to store all autoit watermarked documents

	;Global 	$NewFolder = DirCreate("$FolderSelected\")

;CHECKBOX 1 for WATERMARK
	If GUICtrlRead($Enable1) = $GUI_CHECKED Then
		If $signoutstate <> $GUI_ENABLE Then
			GUICtrlSetState($txt1,$GUI_ENABLE)
			$other = $GUI_ENABLE
        EndIf

	ElseIf $other <> $GUI_DISABLE Then
		GUICtrlSetState($txt1,$GUI_DISABLE)
        $other = $GUI_DISABLE

		EndIf

;CHECKBOX 3 for SPLIT - FROM and TO


	If GUICtrlRead($Enable2) = $GUI_CHECKED Then
		If $signoutstate <> $GUI_ENABLE Then
			GUICtrlSetState($txt3,$GUI_ENABLE)
			GUICtrlSetState($txt4,$GUI_ENABLE)
			$other = $GUI_ENABLE
        EndIf

	ElseIf $other <> $GUI_DISABLE Then
		GUICtrlSetState($txt3,$GUI_DISABLE)
		GUICtrlSetState($txt4,$GUI_DISABLE)
        $other = $GUI_DISABLE

		EndIf


;CHECKBOX 2 for FOOTER

	If GUICtrlRead($Enable) = $GUI_CHECKED Then
		If $signoutstate <> $GUI_ENABLE Then
			GUICtrlSetState($txt2,$GUI_ENABLE)
			$other = $GUI_ENABLE
        EndIf

	ElseIf $other <> $GUI_DISABLE Then
		GUICtrlSetState($txt2,$GUI_DISABLE)
        $other = $GUI_DISABLE

		EndIf

;CHECKBOX 3 for SPLIT - FROM and TO


	If GUICtrlRead($Enable2) = $GUI_CHECKED Then
		If $signoutstate <> $GUI_ENABLE Then
			GUICtrlSetState($txt3,$GUI_ENABLE)
			GUICtrlSetState($txt4,$GUI_ENABLE)
			$other = $GUI_ENABLE
        EndIf

	ElseIf $other <> $GUI_DISABLE Then
		GUICtrlSetState($txt3,$GUI_DISABLE)
		GUICtrlSetState($txt4,$GUI_DISABLE)
        $other = $GUI_DISABLE

		EndIf

;CHECKBOX 1 for WATERMARK
	If GUICtrlRead($Enable1) = $GUI_CHECKED Then
		If $signoutstate <> $GUI_ENABLE Then
			GUICtrlSetState($txt1,$GUI_ENABLE)
			$other = $GUI_ENABLE
        EndIf

	ElseIf $other <> $GUI_DISABLE Then
		GUICtrlSetState($txt1,$GUI_DISABLE)
        $other = $GUI_DISABLE

		EndIf


;CHECKBOX 2 for FOOTER

	If GUICtrlRead($Enable) = $GUI_CHECKED Then
		If $signoutstate <> $GUI_ENABLE Then
			GUICtrlSetState($txt2,$GUI_ENABLE)
			$other = $GUI_ENABLE
        EndIf

	ElseIf $other <> $GUI_DISABLE Then
		GUICtrlSetState($txt2,$GUI_DISABLE)
        $other = $GUI_DISABLE

		EndIf

;CHECKBOX 3 for SPLIT - FROM and TO


	If GUICtrlRead($Enable2) = $GUI_CHECKED Then
		If $signoutstate <> $GUI_ENABLE Then
			GUICtrlSetState($txt3,$GUI_ENABLE)
			GUICtrlSetState($txt4,$GUI_ENABLE)
			$other = $GUI_ENABLE
        EndIf

	ElseIf $other <> $GUI_DISABLE Then
		GUICtrlSetState($txt3,$GUI_DISABLE)
		GUICtrlSetState($txt4,$GUI_DISABLE)
        $other = $GUI_DISABLE

		EndIf


;CHECKBOX 2 for FOOTER

	If GUICtrlRead($Enable) = $GUI_CHECKED Then
		If $signoutstate <> $GUI_ENABLE Then
			GUICtrlSetState($txt2,$GUI_ENABLE)
			$other = $GUI_ENABLE
        EndIf

	ElseIf $other <> $GUI_DISABLE Then
		GUICtrlSetState($txt2,$GUI_DISABLE)
        $other = $GUI_DISABLE

		EndIf

;CHECKBOX 1 for WATERMARK
	If GUICtrlRead($Enable1) = $GUI_CHECKED Then
		If $signoutstate <> $GUI_ENABLE Then
			GUICtrlSetState($txt1,$GUI_ENABLE)
			$other = $GUI_ENABLE
        EndIf

	ElseIf $other <> $GUI_DISABLE Then
		GUICtrlSetState($txt1,$GUI_DISABLE)
        $other = $GUI_DISABLE

	EndIf


;3) Now enter button should be coded to retrieve the text from watermark, footer and split to, and perform the corresponding actions

	Switch $nMsg
		Case $Button2
			$UserInput1 = GUICtrlRead($txt1)
			$UserInput2 = GUICtrlRead($txt2)
			$UserInput3 = GUICtrlRead($txt3)
			$UserInput4 = GUICtrlRead($txt4)

			If GUICtrlRead($Enable)= $GUI_CHECKED Then
				Footer()
			EndIf
			Sleep (3000)
			If GUICtrlRead($Enable1) = $GUI_CHECKED Then
				Watermark()
			EndIf
			If GUICtrlRead($Enable2) = $GUI_CHECKED Then
				Split()
			EndIf

			;i=0
			;For i in $Browse
				;$Browseinput = GUICtrlRead($txt1)
				;a = _Array2DCreate ( $Browseinput, a )
				;i = i+1
			;Next
				 ;MsgBox("Appended the list")
	EndSwitch
		WEnd

;### FUNCTION TO LAUNCH PDF FILL ########
	Func LaunchPDfill()
		;$pdffill = $txt5
		$pdffill = "D:\PDF fill\PDFill_PDF_Tools.exe"
		Run($pdffill)
	EndFunc




;4) Function for footer for PDFill program
	Func Footer()
		LaunchPDfill()
		Sleep(1000)
		ControlClick("PDFill PDF Tools 15.0 (Free and No Watermark)","6. Add Header and Footer",300,"Left")
		Sleep(1000)
		ControlSetText("Select a PDF file to Add Header and Footer","",1148,$FileSelected)
		ControlClick("Select a PDF file to Add Header and Footer","&Open",1,"Left")
		Sleep (3000)
		ControlClick("Free PDF Tools: Add Header and Footer","Add Header",227,"Left")
		ControlClick("Free PDF Tools: Add Header and Footer","Show Page Number",179,"Left")
		ControlSetText("Free PDF Tools: Add Header and Footer","",149,$UserInput2)
		Sleep (1000)
		ControlSetText("Free PDF Tools: Add Header and Footer","",152,"")
		ControlSend ( "Free PDF Tools: Add Header and Footer", "", 196, "Right")
		Sleep (1000)
		ControlClick("Free PDF Tools: Add Header and Footer","Save As ...",1,"Left")
		Sleep (1200)

		Dim $Path = $FileSelected
		Dim $szDrive, $szDir, $szFName, $szExt
		_PathSplit($Path, $szDrive, $szDir, $szFName, $szExt)
		;DirMove(@DesktopDir & "\"& $OldName, @DesktopDir & "\"& $NewName)
		;$FooterDocumentPath = FileOpenDialog ( "", "$NewFolder","All (*.*)",$FD_PATHMUSTEXIST)
		ControlSetText("Save the new file as ... ","",1001,"Watermarked - "&$szFName)
		Sleep (1000)
		ControlClick("Save the new file as ... ","&Save",1,"Left")
		WinWaitActive("[CLASS:AcrobatSDIWindow]")
		WinActivate("[CLASS:AcrobatSDIWindow]")
		WinClose("[CLASS:AcrobatSDIWindow]")
		Global $FooterOutput = $szDir&"Watermarked - "&$szFName
		;Send("!+{F4}",0)
		;$FnToPrt = $FileSelected
		;$szService = "Acroview"
		;$szTopic = "Control"
		;$szCommand = '[FilePrintSilent("'&$FnToPrt&'")][AppExit()]'
		;_DDEMLClient_Execute($szService, $szTopic, $szCommand)

	EndFunc

;5) Function for Watermark for PDFill program
	Func Watermark()
		Sleep (2000)
		LaunchPDfill()
		Sleep (1000)
		ControlClick("PDFill PDF Tools 15.0 (Free and No Watermark)","7. Add Watermark by Text",301,"Left")
		Sleep(1000)
		Global $FolderSelected = StringRegExpReplace($FileSelected, "\\[^\\]+$", "")
		ControlSetText("Select a PDF file to Add Watermark by Text","",1148,$FooterOutput)
		ControlClick("Select a PDF file to Add Watermark by Text","&Open",1,"Left")
		Sleep (3000)
		ControlSetText("Free PDF Tools: Add Watermark by Text","",10384,$UserInput1)
		ControlSend ( "Free PDF Tools: Add Watermark by Text", "", 235, "Diagonal")
		ControlSend ( "Free PDF Tools: Add Watermark by Text", "", 233, "Foreground")
		Sleep (1000)
		ControlClick("Free PDF Tools: Add Watermark by Text","Save As ...",1,"Left")
		Sleep (1200)
		Dim $Path = $FileSelected
		Dim $szDrive, $szDir, $szFName, $szExt
		_PathSplit($Path, $szDrive, $szDir, $szFName, $szExt)

		ControlSetText("Save the wartermarked file as ... ","",1001,"Watermarked1 - "&$szFName)
		Sleep (1000)
		ControlClick("Save the wartermarked file as ... ","&Save",1,"Left")
		Sleep (1200)
		ControlClick("Save As","&Yes",6,"Left")

		WinWaitActive("[CLASS:AcrobatSDIWindow]")
		WinActivate("[CLASS:AcrobatSDIWindow]")
		WinClose("[CLASS:AcrobatSDIWindow]")

		Global $WatermarkOutput = $szDir&"Watermarked1 - "&$szFName
	EndFunc


;6) Function for Split from and To for PDFill program
	Func Split()
		Sleep (2000)
		LaunchPDfill()
		Sleep (1000)
		ControlClick("PDFill PDF Tools 15.0 (Free and No Watermark)","2. Split or Reorder Pages",296,"Left")
		Sleep(1000)
		ControlSetText("Select a PDF file to Split or Reorder","",1148,$WatermarkOutput)
		ControlClick("Select a PDF file to Split or Reorder","&Open",1,"Left")
		Sleep (3000)
		ControlSetText("Free PDF Tools: Split, Reorder or Delete PDF Pages","",251,$UserInput3)
		ControlSetText("Free PDF Tools: Split, Reorder or Delete PDF Pages","",252,$UserInput4)
		Sleep (1000)
		ControlClick("Free PDF Tools: Split, Reorder or Delete PDF Pages","Save As ...",1,"Left")
		Sleep (1200)
		Dim $Path = $FileSelected
		Dim $szDrive, $szDir, $szFName, $szExt
		_PathSplit($Path, $szDrive, $szDir, $szFName, $szExt)

		ControlSetText("Save the splitted file as ... ","",1001,"Watermarked2 - "&$szFName)
		Sleep (1000)
		ControlClick("Save the splitted file as ... ","&Save",1,"Left")
		Sleep (1200)
	EndFunc


