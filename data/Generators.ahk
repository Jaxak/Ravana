ReadFile(file){
    FileRead, Txt, %file%
Return StrSplit(Txt, " ")
}

GetFIO(){
	Return ["Тестовое", "Имя", "Пользователя"]
}

GetCity(){
	file:="data\ListOfСities"
	FileEncoding, UTF-8
	a:=ReadFile(file)
	Random, x, 1, a.MaxIndex()
	result:=a[x]
Return result
}
GetStreet(){
	Return "Тестовое название улицы"
}

GetInnIP(){
	inna:= ["7", "2", "4", "10", "3", "5", "9", "4", "6", "8"]
	innb:= ["3", "7", "2", "4", "10", "3", "5", "9", "4", "6", "8"]
	i:= 0 
	ka:= 0
	kb:= 0
	inn:= 0 
	Loop, 10 {
		i:=i+1
		Random, rm, 1, 9
		inn:= inn*10 + rm
		ka:= ka + rm*inna[i]
		kb:= kb + rm*innb[i]
        if (i=10){
            nka:=Mod(ka, 11)
            if(nka=10){
                nka:=0
            }
            kb:= kb + nka*innb[i+1]
            nkb:=Mod(kb, 11)
            if(nkb=10){
                nkb:=0
            }
            inn:=inn*100+nka*10+nkb
			}
	}
	clipboard = %inn%
Return inn
}

GetInnUl(){
    innc:= ["2", "4", "10", "3", "5", "9", "4", "6", "8"]
	i:= 0
	ka:= 0 
	inn:= 0 
	Loop, 9 { 
		i:=i+1
		Random, rm, 1, 9 
		inn:= inn*10 + rm
		ka:= ka + rm*innc[i]
		if (i=9){
			nka:=Mod(ka, 11)
			if(nka=10){
				nka:=0
			}
			inn:=inn*10+nka
		}
	}
	clipboard = %inn%
Return inn
}

GetKppByInn(inn){
	kpp:= Mod(inn, 10**6)
	kpp:= Round((inn - kpp)/10)
	Random, lkpp, 1001, 9896
	kpp:=kpp+lkpp
	Return kpp
}

GetEmail(){
	Random, emailNumber, 0, 9999999
	mail=testmailbox%emailNumber%@test.test
Return mail
}

GetOrganizationName(){
	Return "Тестовое название организации"
}

GetRandomDate(){ ; возвращает строку в формате ddmmgggg 
    Random, dd, 1, 28
    Random, mm, 1, 12
    Random, gg, 1950, 2017
    if (dd <=9){
        dd=0%dd%
    }
    if (mm <=9){
        mm=0%mm%
    }
    data=%dd%%mm%%gg%
return data
}

GetOgrn(){
	Random, ogrna, 111111, 999999
	Random, ogrnb, 111111, 999999
	ogrn:=ogrna*10**6+ogrnb
	kontrol:=Mod(ogrn, 11)
	if(kontrol=10){
			kontrol:=0
			}
	ogrn:=ogrn*10+kontrol
Return ogrn
}

GetOgrnIp(){
	Random, ogrna, 1111111, 9999999
	Random, ogrnb, 1111111, 9999999
	ogrn:=ogrna*10**7+ogrnb
	kontrol:=Mod(ogrn, 13)
	if(kontrol>9){
			kontrol:=kontrol-10
			}
	ogrn:=ogrn*10+kontrol
Return ogrn
} 

GetPhone(){ ; без 8 и +7
   	Random, phone, 1000000, 9999999
	phone:=700*10**7+phone
Return phone
}

GetBankAccount(){
	account=
	Loop, 20 {
		random, ras, 0, 9 
		account=%account%%ras%
    }
Return account
}

GetPost(){
	Return "Тестовая должность"
}

GetSnils(){
	snils:=0
	i:=9
	sum:=0
	loop, 9 {
		random, nom, 1, 9
		snils:=snils*10+nom
		sum:=sum+nom*i
		i:=i-1
	}
	if (sum <100) {
		snils:=snils*100+sum
	}
	if (sum = 100 and sum = 101) {
		snils:=snils*100
	}
	if (sum > 101) {
		sum:=Mod(sum, 101)
		snils:=snils*100+sum
	}
Return snils
}