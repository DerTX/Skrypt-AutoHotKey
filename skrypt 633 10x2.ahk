; LICENSE: GNU General Public License v3.0
 ;___________________
;Skrypt napisany przez:
;  discopolo_PT
;Skrypt napisany dla Gildi
;		[PT]
;___________________
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
		Command("/repair") ;Komenda "/repair" lub "/naprawkilof" (musi być /)
		Command("discopolo_PT <3") ; Widomość na chacie
		Eat(2)				;Ilosc zjedzonego mięska
		Dig(25)    				;Ilosc Okrążeń na stoniarce
	}
Return

;____________________
Exit:
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

reJoin(){
	SendInput {T}
	Wait(100)
	setMPos(500, 420)
	SendInput {LButton}
	Wait(500)
	SendInput {Enter}
	Wait(200)
}
Eat(int){
	SendInput {2}
	loop, %int%{
		SendInput {RButton down}
		Wait(1600)
		SendInput {RButton up}
		Wait(200)
	}
	SendInput {1}
}

Dig(int){
	SendInput {LButton down}
	Move(int)
	SendInput {LButton up} 
}

Move(int){
	loop, %int%{
		Press("D", 10)
		Press("S", 2)
		Press("A", 10)
		Press("W", 2)
	}
}

InventoryChecking(){
x := 503
y := 385
l := 0
i := 0
	SendInput {e}
	loop, 36{  ;TODO liczba paskow
		if(i = 9){
			i := 0
			l++
		}
		Wait(200)
		setMPos(x +36*i, y + 35*l)
		DropGold()
		i++
	}
	SendInput {e}
	Wait(100)
}


dropGold(){
goldcolor := 0x808080
color:= getColor()
if(color = goldcolor){
		sendInput, {LCtrl down}{q}
		Wait(100)
		SendInput {LCtrl up}
	}
}
getColor(){
	MouseGetPos, X,Y
	PixelGetColor, color, %X%, %Y%
	return color
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

setMPos(x, y){
	MouseMove,x,y
}


Wait(s){
	sleep, s
}
;												all rights reserved
;												    discopolo_PT
