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
query = "SELECT * FROM [dbo].[Cabins] ORDER BY [number] ASC"
Set rs = conn.execute(query)

Function CabinName(cabinType)
  If CInt(cabinType) = 0 Then
    CabinName = "Cabaña Clasica"
  End If
  If CInt(cabinType) = 1 Then
    CabinName = "Cabaña Amigos"
  End If
  If CInt(cabinType) = 2 Then
    CabinName = "Cabaña Familiar"
  End If
End Function

Function CabinSatus(status)
  If CInt(status) = 0 Then
    CabinSatus = "Activada"
  End If
  If CInt(status) = 1 Then
    CabinSatus = "Desactivada"
  End If
End Function

Sub PrintReservation(cabinId, number, cabinType, status, cost)
  Response.Write("<tr>")
  Response.Write("<td>Cabaña #"&number&"</td>")
  Response.Write("<td>"&CabinName(cabinType)&"</td>")
  Response.Write("<td>"&CabinSatus(status)&"</td>")
  Response.Write("<td>$"&cost&" MXN</td>")
  Response.Write("<td class=""c actions"">")
  Response.Write("<div>")
  If CInt(status) = 0 Then
    Response.Write("<form action=""deactivateCabin.asp"" method=""post"">")
    Response.Write("<input type=""hidden"" name=""cabinId"" value="""&cabinId&""">")
    Response.Write("<button type=""submit"">Desactivar cabaña</button>")
    Response.Write("</form>")
  End If
  If CInt(status) = 1 Then
    Response.Write("<form action=""activateCabin.asp"" method=""post"">")
    Response.Write("<input type=""hidden"" name=""cabinId"" value="""&cabinId&""">")
    Response.Write("<button type=""submit"">Activar cabaña</button>")
    Response.Write("</form>")
  End If
  Response.Write("<form action=""deleteCabin.asp"" method=""post"">")
  Response.Write("<input type=""hidden"" name=""cabinId"" value="""&cabinId&""">")
  Response.Write("<button type=""submit"">Eliminar cabaña</button>")
  Response.Write("</form>")
  Response.Write("</div>")
  Response.Write("</td>")
  Response.Write("</tr>")

End Sub

%>
<!DOCTYPE html>
<html lang="es">

  <head>
    <meta charset="UTF-8">
    <title>Caguamocabañas | Control de Cabañas</title>
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
        <a class="mat-button active" href="#">Control de Cabañas</a>
        <a class="mat-button" href="/admin/users">Control de Usuarios</a>
      </div>

      <div class="reservationsTableWrapper">

        <table class="reservationsTable" border="1">
          <thead>
            <tr>
              <th>No. de Cabaña</th>
              <th>Tipo</th>
              <th>Estado</th>
              <th>Precio por noche</th>
              <th class="actions">Acciones</th>
            </tr>
          </thead>
          <tbody>
            <%
            If rs.EOF Then
              Response.Write("No hay cabañas")
            Else
              Do While Not rs.EOF
                Call PrintReservation(rs("cabinId"), rs("number"), rs("type"), rs("status"), rs("cost"))
                rs.MoveNext
              Loop
            End If
            %>
          </tbody>
        </table>

        <h2 class="divider"><strong>Añadir cabaña</strong></h2>
        <form action="addCabin.asp" method="post" class="addCabinForm">
          <div class="input-box">
            <label for="cabinNumber">Numero de la cabaña</label>
            <input type="number" name="cabinNumber" id="cabinNumber" required>
          </div>
          <div class="input-box">
            <label for="cabinType">Tipo</label>
            <select name="cabinType" id="cabinType" required>
              <option value="0">Cabaña Clasica (Hasta 2 Personas)</option>
              <option value="1">Cabaña Amigos (Hasta 5 Personas)</option>
              <option value="2">Cabaña Familiar (Hasta 10 Personas)</option>
            </select>
          </div>
          <div class="input-box">
            <label for="cabinPrice">Precio por noche (MXN)</label>
            <input type="number" name="cabinPrice" id="cabinPrice" required>
          </div>
          <button type="submit" class="submit-button"><img src="/resources/svg/send.svg" alt=""></button>
        </form>

      </div>
    </div>

    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/moment.js"></script>
  </body>

</html>
