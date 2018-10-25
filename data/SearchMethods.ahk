TakeSelectedFragment(){ ; забираем выделенный фрагмент
	CurrentClipboardValue := ClipboardAll
	Clipboard = 
	Send, ^c
	ClipWait, 1
	result := Clipboard
	Clipboard := CurrentClipboardValue
	ClipWait, 0.5
Return result
}

SelectNSymbols(n){
	Send, {ShiftDown}{Left %n%}{ShiftUp}
Return
}

SelectString(){
	Send, {Home}{ShiftDown}{End}{ShiftUp}
Return
}

IsInput(){
	Send, {end}1
	SelectNSymbols(1)
	if (TakeSelectedFragment()="1"){
		Send, {Delete}
		Return true
	}
Return false
}

IsCountryField(){
	a:= TakeSelectedFragment()
	Return (a="RU" or a="RU Российская Федерация")
}

IsSnilsField(){
	Return (TakeSelectedFragment()="___-___-___ __")
}

IsKpp(value){ ; костыль
	Return (StrLen(value)=9)
}