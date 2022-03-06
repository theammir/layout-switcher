;OPTIMIZATIONS START
#NoEnv
#MaxHotkeysPerInterval 99000000
#HotkeyInterval 99000000
#KeyHistory 0
ListLines Off
Process, Priority, , A
SetBatchLines, -1
SetKeyDelay, -1, -1
SetMouseDelay, -1
SetDefaultMouseSpeed, 0
SetWinDelay, -1
SetControlDelay, -1
SendMode Input
;OPTIMIZATIONS END

MI := -1
EI := -1

MAIN_LANGUAGES := {1: 0x0419, 2: 0x0409} ; Russian, English
mlen := 0
for i, v in MAIN_LANGUAGES
    mlen++

EXTRA_LANGUAGES := {1: 0x0422, 2: 0x040b} ; Ukrainian, Finnish
elen := 0
for i, v in EXTRA_LANGUAGES
    elen++

; Changing between MAIN_LANGUAGES
~LAlt & LShift::
~LShift & LAlt::
MI++
EI := -1
mlangIndex := mod(MI, mlen) + 1
SetDefaultKeyboard(MAIN_LANGUAGES[mlangIndex])
return

; Changing between EXTRA_LANGUAGES
~LControl & LShift::
~LShift & LControl::
EI++
MI := -1
elangIndex := mod(EI, elen) + 1
SetDefaultKeyboard(EXTRA_LANGUAGES[elangIndex])
return

; Mapping Num keys
#If GetKeyState("RControl", "P")
0::Numpad0
1::Numpad1
2::Numpad2
3::Numpad3
4::Numpad4
5::Numpad5
6::Numpad6
7::Numpad7
8::Numpad8
9::Numpad9
return

SetDefaultKeyboard(LocaleID){
	Global
	SPI_SETDEFAULTINPUTLANG := 0x005A
	SPIF_SENDWININICHANGE := 2
	Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
	VarSetCapacity(Lan%LocaleID%, 4, 0)
	NumPut(LocaleID, Lan%LocaleID%)
	DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "UPtr", &Lan%LocaleID%, "UInt", SPIF_SENDWININICHANGE)
	WinGet, windows, List
	Loop %windows% {
		PostMessage 0x50, 0, %Lan%, , % "ahk_id " windows%A_Index%
	}
}
return