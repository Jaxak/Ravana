﻿#Include, data\Generators.ahk
#Include, data\SearchMethods.ahk
#Include, data\FieldFiller.ahk
#Include, data\PrintingMethods.ahk
#Include, data\logs.ahk
; #####################################################################################################################################
; БЛОК НАСТРОЙКИ ГОРЯЧИХ КЛАВИШ 	--> 	; ! alt 	; # win 	; ^ ctrl 	; + shift
; #####################################################################################################################################

;....................ПАРТНЕРКА....................

^1:: FillBillFieldsForIP()  ; генерация ИНН для ИП и названия организации
return
^2:: FillBillFieldsForUL()	; генерация ИНН для ЮР и названия организации
return
^3:: FillContactFields() ; заполнение контактных данных
return
^4:: FillRequisitesByFIAS() ; заполняем реквизиты по ФИАС
return
^5:: FillManagerFields() ; создание нового менеджера
return
^6:: FillDocumentFields() ; заполнение полей печати документов
return

;....................Полезные фичи....................

^numpad7:: Send % ArrayToStr(GetFIO()) ; генерация фио в одну строку
return
^numpad8:: Send % GetPhone() ; генерация телефона
return
^numpad9:: Send % GetEmail() ; генерация Мыла
return
^VK51:: Send % GetInnIp() ; ctrl+Q ; генерируем, вставляем и запоминаем в буфер ИНН
return
^CapsLock::
value:=TakeSelectedFragment()
StringUpper, value, value
InsertValue(value) ; меняет регистр на верхний в поле
return
^Numpad5:: Run log.txt ; открыть логи
return

;....................Дополнительно....................

^AppsKey:: OpenHelper() ; вызов справки
return
AppsKey:: Run log.txt ; открыть логи
return