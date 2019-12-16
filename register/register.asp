<%

name = Request.Form("name")
lastName = Request.Form("last-name")
username = Request.Form("username")
password = Request.Form("password")
passwordRepeat = Request.Form("password-repeat")
phone = Request.Form("phone")
rfc = Request.Form("rfc")
sex = Request.Form("sex")
age = Request.Form("age")
address = Request.Form("address")

If password <> passwordRepeat Then
  Response.Redirect("Default.asp")
  Response.End
End If

' Conection to database
Set connection = CreateObject("ADODB.Connection")
connection.ConnectionString = "Provider=SQLOLEDB;Server=VIKTORSML-PC\SQLEXPRESS;database=cabins;uid=sa;pwd=apocohaycontra"
connection.open

If connection.state = 1 Then
  Set command = Server.CreateObject("ADODB.command")
  command.ActiveConnection = connection
  command.commandType = 4
Else
  Response.Write("No conectado a la base de datos")
End If
' Ends conection to database

command.commandText = "Register"
command.Parameters("@name") = name
command.Parameters("@lastName") = lastName
command.Parameters("@username") = username
command.Parameters("@password") = password
command.Parameters("@phone") = phone
command.Parameters("@rfc") = rfc
command.Parameters("@sex") = sex
command.Parameters("@age") = age
command.Parameters("@address") = address
command.Parameters("@type") = 0
command.execute

Response.Cookies("user") = username
Response.Redirect("/")
%>