<%
username = Request.Form("username")
password = Request.Form("password")

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

command.commandText = "Login"
command.Parameters("@username") = username
command.Parameters("@password") = password

Set table = command.execute

If not table.EOF  Then
  Response.Write("Bienvenido")
  Response.Cookies("user") = username
  Response.Redirect("/")
Else
  Response.Write("Usuario no valido")
  Response.Redirect("Default.asp")
End If

%>