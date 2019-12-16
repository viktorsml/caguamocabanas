<%
user = Request.Cookies("user")
If Len(user) = 0 Then
  Response.Redirect("/login")
  Response.End
End If

Dim conn
Dim rs

Set conn = Server.CreateObject("ADODB.Connection")
set rs = Server.CreateObject("ADODB.recordset")
conn.ConnectionString = "Provider=SQLOLEDB;Server=VIKTORSML-PC\SQLEXPRESS;database=cabins;uid=sa;pwd=apocohaycontra;"
conn.Open
user = Request.Cookies("user")
query = "SELECT [name], [lastName], [username], [type] FROM [dbo].[Users] ORDER BY [type] DESC"
Set rs = conn.execute(query)

Function ReadableUserType(rawUserType)
  If CInt(rawUserType) = 0 Then
    ReadableUserType = "Cliente"
  End If
  If CInt(rawUserType) = 1 Then
    ReadableUserType = "Administrador"
  End If
End Function

Sub PrintUser(name, lastName, username, rawUserType)
  Response.Write("<tr>")
  Response.Write("<td>"&name&" "&lastName&"</td>")
  Response.Write("<td>"&username&"</td>")
  Response.Write("<td>"&ReadableUserType(rawUserType)&"</td>")
  Response.Write("<td class=""c actions"">")
  Response.Write("<div>")
  If CInt(rawUserType) = 0 Then
    Response.Write("<form action=""ascendToAdmin.asp"" method=""post"">")
    Response.Write("<input type=""hidden"" name=""username"" value="""&username&""">")
    Response.Write("<button type=""submit"">Ascender a administrador</button>")
    Response.Write("</form>")
  End If
  If (CInt(rawUserType) = 1) And (username <> user) Then
    Response.Write("<form action=""descentToClient.asp"" method=""post"">")
    Response.Write("<input type=""hidden"" name=""username"" value="""&username&""">")
    Response.Write("<button type=""submit"">Remover administrador</button>")
    Response.Write("</form>")
  End If
  Response.Write("</div>")
  Response.Write("</td>")
  Response.Write("</tr>")
End Sub

%>
<!DOCTYPE html>
<html lang="es">

  <head>
    <meta charset="UTF-8">
    <title>Caguamocabañas | Control de Usuarios</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link
      href="https://fonts.googleapis.com/css?family=Girassol|Libre+Franklin:100,200,300,400,500,600,700,800,900&display=swap"
      rel="stylesheet">
    <link rel="stylesheet" href="/resources/css/normalize.css">
    <link rel="stylesheet" href="/resources/css/main.css">
    <link rel="stylesheet" href="/admin/admin.css">
  </head>

  <body>
    <!--#include virtual="/resources/includes/header.inc"-->
    <%
    If CInt(userType) = 0 Then
      Response.Redirect("/")
      Response.End
    End If
    %>
    <div class="responsiveContainer">
      <h1>Panel de control</h1>

    <div class="tabbed-menu">
      <a class="mat-button" href="/admin/reservations">Reservaciones</a>
      <a class="mat-button" href="/admin/cabins">Control de Cabañas</a>
      <a class="mat-button active" href="#">Control de Usuarios</a>
    </div>

      <div class="reservationsTableWrapper">
        
        <table class="reservationsTable" border="1">
          <thead>
            <tr>
              <th>Nombre</th>
              <th>Usuario</th>
              <th>Tipo</th>
              <th class="actions">Acciones</th>
            </tr>
          </thead>
          <tbody>

            <%
            If rs.EOF Then
              Response.Write("No hay usuarios")
            Else
              Do While Not rs.EOF
                Call PrintUser(rs("name"), rs("lastName"), rs("username"), rs("type"))
                rs.MoveNext
              Loop
            End If
            %>

          </tbody>
        </table>
      </div>
    </div>

    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/moment.js"></script>
  </body>

</html>
