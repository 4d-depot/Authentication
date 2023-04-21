var $user : cs:C1710.UsersEntity
var $indexIdentifier; $indexPassword : Integer
var $identifier; $password : Text
var $url : Text

$url:=$1

Case of 
	: (Position:C15("authenticate"; $url)#0)
		
		WEB GET HTTP HEADER:C697($anames; $avalues)
		$indexIdentifier:=Find in array:C230($anames; "identifier")
		$identifier:=$avalues{$indexIdentifier}
		
		$indexPassword:=Find in array:C230($anames; "password")
		$password:=$avalues{$indexPassword}
		
		$user:=ds:C1482.Users.query("identifier = :1"; $identifier).first()
		
		If ($user#Null:C1517)
			If (Verify password hash:C1534($password; $user.password))
				Session:C1714.clearPrivileges()
				Session:C1714.setPrivileges(New object:C1471("roles"; $user.role; "userName"; $user.firstname+" "+$user.lastname))
				//Session.userName:=$user.firstname+" "+$user.lastname
				Use (Session:C1714.storage)
					Session:C1714.storage.info:=New shared object:C1526("role"; $user.role)
				End use 
				WEB SEND TEXT:C677("OK")
			Else 
				WEB SEND TEXT:C677("Authentication failed: wrong password")
			End if 
		Else 
			WEB SEND TEXT:C677("Authentication failed: wrong user")
		End if 
		
		
		
End case 


