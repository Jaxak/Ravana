﻿FillBillFieldsForIP(){
	arr:=[GetInnIP(), "", GetOrganizationName()]
	Println(arr)
	Addlog(arr)	
	return
}

FillBillFieldsForUL(){
	inn:=GetInnUl()
	kpp:=GetKppByInn(inn)
	arr:=[inn, kpp, GetOrganizationName()]
	Println(arr)
	Addlog(arr)	
	return
}

FillContactFields(){
	arr:=[ArrayToStr(GetFIO()), GetPost(), GetPhone(), "", GetEmail(), "", "Равана"]
	Println(arr)
	Send, {Enter}
return
}

FillManagerFields(){
	arr:=[ArrayToStr(GetFIO()), GetEmail(), GetEmail()]
	println(arr)
	Send, {Enter}
	RETURN
}

FillRequisitesByFIAS(){
	send, ^a{delete}{tab 2}
	Random, home,1,100
	Random, home2,1,100
	Send % GetCity()
	sleep, 2000
	Send, {down}{enter}{tab}
	arr1:= [GetStreet(), home, "", home2, "", "123456"]
	Println(arr1)
	Send, {Enter} ; нажимаем сохранить
	KeyWait,  LButton, D ; ждем пока кликнут на поле фактический адрес
	arr2:=["Можно на галку ткнуть", 0, GetBankAccount(), GetEmail()]
	Println(arr2)
RETURN
}

FillDocumentFields(){
	Sleep, 100
	Array:=[ArrayToStr(GetFIO()), "скриптовой доверенности от 01.09.2018 №262/2018", GetPost(), ArrayToStr(GetFIO()), "Справедливого решения верховных жрецов", GetPost(), GetPost(), "С.О. Прист", "Строка для адреса коробки в которой проживает", GetBankAccount(), 0, GetPost(), "Х.К. Равана"]
	capsActive:=IsCapsActive()
	Loop, 13 {
		SelectString()
		If (a_index=9){
			sleep, 300
			Send, ^a
		}
		If (a_index=10){
			sleep, 300
			Send, ^a
			if(IsKpp(TakeSelectedFragment())){
				Send, {TAB}
			}
		}
		a:=TakeSelectedFragment()
		If(a!=""){
			Array[A_Index]:=a
		}
		value:=Array[A_Index]
		If(capsActive=true){
			StringUpper, value, value
		}
		Send % value
		Send {Tab}
	}
Return
}

OpenHelper(){ 
	FileEncoding, UTF-8
	FileRead, komands, ReadMe.txt
	msgbox % komands
RETURN
}