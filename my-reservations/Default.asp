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
query = "SELECT * FROM [dbo].[Reservations] WHERE [userId] IN (SELECT [userId] FROM [dbo].[Users] WHERE [username] = '"&user&"')"
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
    CabinSatus = "Reservación confirmada en la cabaña #"
  End If
  If CInt(reservationStatus) = 2 Then
    CabinSatus = "Reservación cancelada"
  End If
End Function

Sub PrintReservation(reservationId, userId, checkIn, checkOut, people, cabinType, reservationStatus, asignatedCabin)
  Response.Write("<div class=""reservation"">")
  Response.Write("<div class=""cabin-image i"&cabinType&"""></div>")
  Response.Write("<div class=""info"">")
  Response.Write("<h2>"&CabinName(cabinType)&"</h2>")
  Response.Write("<p>"&people&" Personas | Precio total: $<span class=""reservationPrice"" data-cabin-type="""&cabinType&""" data-res-sel=""res"&reservationId&"""></span> MXN</p>")
  Response.Write("<p>Check-In: <strong><em res"&reservationId&"-ci data-date="""&checkIn&"""></em></strong> | Check-Out: <strong><em res"&reservationId&"-co data-date="""&checkOut&"""></em></strong></p>")
  Response.Write("<div class=""status s"& reservationStatus &""">")
  If (CInt(reservationStatus) = 1) And (CInt(asignatedCabin) <> 0) Then
    Response.Write(CabinSatus(reservationStatus)& asignatedCabin)
  Else
    Response.Write(CabinSatus(reservationStatus))
  End If
  Response.Write("</div>")
  Response.Write("</div>")
  Response.Write("</div>")
End Sub

%>
<!DOCTYPE html>
<html lang="es">

  <head>
    <meta charset="UTF-8">
    <title>Caguamocabañas | Mis Reservaciones</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link
      href="https://fonts.googleapis.com/css?family=Girassol|Libre+Franklin:100,200,300,400,500,600,700,800,900&display=swap"
      rel="stylesheet">
    <link rel="stylesheet" href="../resources/css/normalize.css">
    <link rel="stylesheet" href="../resources/css/main.css">
    <link rel="stylesheet" href="my-reservations.css">
  </head>

  <body>
    <!--#include virtual="/resources/includes/header.inc"-->
    <%
    If CInt(userType) = 1 Then
      Response.Redirect("/admin")
      Response.End
    End If
    %>
    <div class="responsiveContainer">
      <h1>Mis Reservaciones</h1>
      <div class="reservationsGrid">
        <%
        If rs.EOF Then
          Response.Write("<p style=""text-align: center; grid-column: 1 / 3;"">No hay reservaciones</p>")
        Else
          Do While Not rs.EOF
            Call PrintReservation(rs("reservationId"), rs("userId"), rs("checkIn"), rs("checkOut"), rs("people"), rs("cabinType"), rs("reservationStatus"), rs("asignatedCabin"))
            rs.MoveNext
          Loop
        End If
        %>
      </div>
    </div>

    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/moment.js"></script>
    <script src="my-reservations.js"></script>
  </body>

</html>
