﻿Pasport(){
	Random, seria, 1111, 9999
	Random, nomer, 100100, 999999
	Random, kod, 100001, 999999
	data:=GetRandomDate()
	a:=[seria, nomer, data, "", kod]
	Println(a)
	Send, {down}{Tab}
	datarojd:=data-2
	if(StrLen(datarojd)<8){
		datarojd=0%datarojd%
	}
	b:=[datarojd, "", GetCity()]
	Println(b)
RETURN
}

SendFormUR(){
	fio:=GetFIO()
	a:=["", GetOrganizationName(), GetOgrn(), "0000000000", "RU", GetCity(), GetStreet(), "Тестовая строка", fio[1], fio[2], fio[3], GetPost(), GetSnils(), GetEmail()]
	n:=SkanCountryField()
	PrintUC(a, n, 1)
	m:=SkanSnilsField()
	PrintUC(a, m+1, n+1)
RETURN
}

SendFormIP(){
	fio:=GetFIO()
	a:=["", GetOrganizationName(), GetOgrnIp(), "0000000000", "RU", GetCity(), GetStreet(), "Тестовая строка", fio[1], fio[2], fio[3], GetPost(), GetSnils(), GetEmail()]
	n:=SkanCountryField()
	PrintUC(a, n, 1)
	m:=SkanSnilsField()
	PrintUC(a, m+1, n+1)
RETURN
}

SkanCountryField(){
	Loop {
		SelectString()
			if(IsCountryField()){
				n:=A_Index
				SendCountryField()
				break
			}
		Send, {Tab}
	}
	Up:=n-1
	Send, {ShiftDown}{Tab %Up%}{ShiftUp}
	
return n
}

SkanSnilsField(){
	Loop {
		Send, ^a
			if(IsSnilsField()){
				n:=A_Index
				break
			}
		Send, {Tab}
	}
	Up:=n-1
	Send, {ShiftDown}{Tab %Up%}{ShiftUp}
return n
}
SendCountryField(){
	p:="66 Свердловская область"
	Send, ^a{Delete}{Tab}
	Send % p
	Send, {ShiftDown}{Tab}{ShiftUp}
	Send, RU
}
PrintUC(Array, n, m){
Loop % n {
		if(Array[m]!=""){
			Send % Array[m]
		}
		Send, {TAB}
		m:=m+1
	}
Return
}