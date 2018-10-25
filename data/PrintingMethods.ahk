Println(Array){ ; Простая функция заполнения полей
	capsActive:=IsCapsActive()
	Loop % Array.Length() {
		value:=Array[A_Index]
		If(capsActive=true){
			StringUpper, value, value
		}
		if(Array[A_Index]!=""){
			Send % value
		}
		Send, {TAB}
	}
Return
}

InsertValue(a){ ; ускореное заполнение поля через буфер обмена
	previousClipboardValue:=ClipboardAll
	Clipboard:=a
	ClipWait, 1
	Send, ^v
	Clipboard:=previousClipboardValue
	ClipWait, 0.5
Return
}

IsCapsActive(){ ; включен или выключен Капслок
	Return GetKeyState("Capslock", "T")  ; True, если CapsLock включён, иначе False.
}

ArrayToStr(Array){
	str=
	Loop % Array.Length(){
			str:=str  Array[A_Index] " "
	}
return RTrim(str)
}