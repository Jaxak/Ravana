AddLog(Array){ ; запись Логов
	FormatTime, TimeString, R
	FileAppend, 
(

%TimeString%

), log.txt
	Loop % Array.Length() {
		str:=Array[A_Index]
		FileAppend,
(
%str%

), log.txt
	}
	FileAppend, `n..................................................`n , log.txt
Return
}