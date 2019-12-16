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
query = "SELECT * FROM [dbo].[Reservations] ORDER BY [reservationStatus] ASC"
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

Function CabinSatus(reservationStatus)
  If CInt(reservationStatus) = 0 Then
    CabinSatus = "Esperando confirmación"
  End If
  If CInt(reservationStatus) = 1 Then
    CabinSatus = "Reservación confirmada"
  End If
  If CInt(reservationStatus) = 2 Then
    CabinSatus = "Reservación cancelada"
  End If
End Function

Sub PrintReservation(reservationId, userId, checkIn, checkOut, people, cabinType, reservationStatus, asignatedCabin)
  Response.Write("<tr>")
  Response.Write("<td>"&userId&"</td>")
  Response.Write("<td>"&CabinName(cabinType)&"</td>")
  Response.Write("<td data-date="""&checkIn&"""></td>")
  Response.Write("<td data-date="""&checkOut&"""></td>")
  Response.Write("<td>"&people&" Personas</td>")
  Response.Write("<td class=""c"">"&CabinSatus(reservationStatus)&"</td>")
  Response.Write("<td class=""c actions"">")
  Response.Write("<div>")
    If (CInt(reservationStatus) = 0) Or (CInt(reservationStatus) = 1) Then
    Response.Write("<form action=""asignCabinToReservation.asp"" id=""cabinSelectorFor"&reservationId&""" method=""post"">")
    Response.Write("<input type=""hidden"" name=""reservationId"" value="""&reservationId&""">")
    Response.Write("<select data-form-id=""cabinSelectorFor"&reservationId&""" name=""cabinNumber"">")
    Response.Write("<option value=""0"">- Asignar Cabaña -</option>")

    Set connCabinList = Server.CreateObject("ADODB.Connection")
    set rsCabinList = Server.CreateObject("ADODB.recordset")
    connCabinList.ConnectionString = "Provider=SQLOLEDB;Server=VIKTORSML-PC\SQLEXPRESS;database=cabins;uid=sa;pwd=apocohaycontra;"
    connCabinList.Open
    queryCabinList = "SELECT [number] FROM [dbo].[Cabins] WHERE [status] = 0 AND [type] = "&cabinType&";"
    Set rsCabinList = connCabinList.execute(queryCabinList)

    If rsCabinList.EOF Then
    Else
      Do While Not rsCabinList.EOF
        If CInt(asignatedCabin) = CInt(rsCabinList("number")) Then
          Response.Write("<option value="""&rsCabinList("number")&""" selected>Cabaña #"&rsCabinList("number")&"</option>")
        Else
          Response.Write("<option value="""&rsCabinList("number")&""">Cabaña #"&rsCabinList("number")&"</option>")
        End If
        rsCabinList.MoveNext
      Loop
    End If
    Response.Write("</select>")
    Response.Write("</form>")

    Response.Write("<form action=""cancelReservation.asp"" method=""post"">")
    Response.Write("<input type=""hidden"" name=""reservationId"" value="""&reservationId&""">")
    Response.Write("<button type=""submit"">Cancelar reservación</button>")
    Response.Write("</form>")
  End If
  If (CInt(reservationStatus) = 2) Then
    Response.Write("<form action=""reactivateReservation.asp"" method=""post"">")
    Response.Write("<input type=""hidden"" name=""reservationId"" value="""&reservationId&""">")
    Response.Write("<button type=""submit"">Reactivar reservación</button>")
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
    <title>Caguamocabañas | Reservaciones</title>
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
      <a class="mat-button active" href="#">Reservaciones</a>
      <a class="mat-button"  href="/admin/cabins">Control de Cabañas</a>
      <a class="mat-button"  href="/admin/users">Control de Usuarios</a>
    </div>
      <div class="reservationsTableWrapper">

        <table class="reservationsTable" border="1">
          <thead>
            <tr>
              <th>Cliente</th>
              <th>Cabaña</th>
              <th>Check-In</th>
              <th>Check-Out</th>
              <th>No. de personas</th>
              <th>Estado</th>
              <th class="actions">Acciones</th>
            </tr>
          </thead>
          <tbody>
            <%
            If rs.EOF Then
              Response.Write("No hay reservaciones")
            Else
              Do While Not rs.EOF
                Call PrintReservation(rs("reservationId"), rs("userId"), rs("checkIn"), rs("checkOut"), rs("people"), rs("cabinType"), rs("reservationStatus"), rs("asignatedCabin"))
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
    <script src="/admin/dateFixer.js"></script>
    <script src="reservations.js"></script>
  </body>

</html>
