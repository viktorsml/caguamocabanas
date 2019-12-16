<%

reservationId = Request.Form("reservationId")
cabinNumber = Request.Form("cabinNumber")

Set conn = Server.CreateObject("ADODB.Connection")
set rs = Server.CreateObject("ADODB.recordset")
conn.ConnectionString = "Provider=SQLOLEDB;Server=VIKTORSML-PC\SQLEXPRESS;database=cabins;uid=sa;pwd=apocohaycontra;"
conn.Open
query = "UPDATE [dbo].[Reservations] SET [reservationStatus] = 1, [asignatedCabin] = "&cabinNumber&" WHERE [reservationId] = '"&reservationId&"';"
Set rs = conn.execute(query)

Response.Redirect("/admin/reservations")

%>