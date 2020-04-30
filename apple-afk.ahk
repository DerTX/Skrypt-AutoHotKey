; LICENSE: GNU General Public License v3.0
;___________________
; SKRYPT NAPISANY PRZEZ
;	  discopolo-skrypt
;___________________
;		[Opcje]		 
;___________________
StartAfk=F8
ExitApp=F9


;____________________
Hotkey,%StartAfk%,Start
Hotkey,%ExitApp%,Exit
Return
;____________________

Start:
	loop{
		Dig(120)
		Command("discopolo_PT <3") ;wiadomość na chacie
		Command("/repair") ;naprawianie norzyc (musi być "/")
	}
Return

;____________________
Exit:
SendInput {RButton}
SendInput {LButton}
ExitApp
Return
;____________________


Command(string){
	SendInput {T}
	Wait(500)
	Send %string%
	Wait(1000)
	SendInput {Enter}
	Wait(200)
}


Eat(int){
	SendInput {3}
	loop, %int%{
		SendInput {RButton down}
		Wait(1600)
		SendInput {RButton up}
		Wait(200)
	}
	SendInput {1}
}


Press(charkey, dist){
	t := getTimeFromDis(dist)
	SendInput {%charkey% down}
	Wait(t)
	SendInput {%charkey% up}
}


getTimeFromDis(s){
t:=0
t:= s*235
return t
}

Dig(int){
	loop, %int%{
		Pows(int)
		Powr(int)
	}
}

Wait(s){
	sleep, s
}

Pows(int){
	SendInput {2}
	loop, %int%			
		SendInput {RButton down}
		Wait(500)
		SendInput {RButton up}
}

Powr(int){
	SendInput {1}
	loop, %int%
		SendInput {LButton down}
		Wait(700)
		SendInput {LButton up}
}

;																																						copyright ©. all right reserved.
													all rights reserved																												
													    discopolo_PT
