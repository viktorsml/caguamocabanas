<%
user = Request.Cookies("user")
If Len(user) = 0 Then
  Response.Redirect("/login")
  Response.End
End If

username = Request.Cookies("user")
checkIn = Request.Form("checkIn")
checkOut = Request.Form("checkOut")
people = Request.Form("people")
cabinType = Request.Form("cabinType")

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

command.commandText = "BookNow"
command.Parameters("@username") = username
command.Parameters("@checkIn") = checkIn
command.Parameters("@checkOut") = checkOut
command.Parameters("@people") = people
command.Parameters("@cabinType") = cabinType
command.execute

Response.Redirect("reservation-completed.asp")

%>