//%attributes = {}



var $user : cs:C1710.UsersEntity
var $status : Object

var $notDropped : cs:C1710.UsersSelection

$notDropped:=ds:C1482.Users.all().drop()



$user:=ds:C1482.Users.new()
$user.identifier:="simpleUser@4d.com"
$user.role:="simpleUser"
$user.password:=Generate password hash:C1533("a")
$user.firstname:="Mary"
$user.lastname:="Smith"
$status:=$user.save()


$user:=ds:C1482.Users.new()
$user.identifier:="superUser@4d.com"
$user.role:="superUser"
$user.password:=Generate password hash:C1533("a")
$user.firstname:="Paul"
$user.lastname:="Johnson"
$status:=$user.save()
