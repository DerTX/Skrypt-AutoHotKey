;___________________
; SKRYPT NAPISANY PRZEZ
;	  discopolo_PT
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
WinMove, Minecraft, , , , 1280, 720
	loop{
		reJoin()				;Wbijanie na serwer
		Command("discopolo <3")
		Wait(3000)
		Command("/naprawkilof")  		;komenda na naprawę kilofa naprawkilof or repair(przed komędami musi być "/")
		Wait(3000)
		Command("/bloki")		;Komenda która tworzy bloki
		InventoryChecking()		; Wyrzuca Bloki.
		Eat(2)					;Ilosc zjedzonego mięska
		Dig(1)    				;Ilosc Okrążeń na stoniarce
	}
Return

;____________________
Exit:
SendInput {LButton}
SendInput {RButton}
Command(Gildia PT <3)
Wait(3000)
Command(discopolo <3)
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
    Wait(1800000)
	SendInput {LButton up} 
}

InventoryChecking(){
x := 503
y := 385
l := 0
i := 0
	SendInput {e}
	loop, 27{  ;TODO liczba paskow
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
		sendInput, {LCtrl down}{Q}
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