<%

reservationId = Request.Form("reservationId")

Set conn = Server.CreateObject("ADODB.Connection")
set rs = Server.CreateObject("ADODB.recordset")
conn.ConnectionString = "Provider=SQLOLEDB;Server=VIKTORSML-PC\SQLEXPRESS;database=cabins;uid=sa;pwd=apocohaycontra;"
conn.Open
query = "UPDATE [dbo].[Reservations] SET [reservationStatus] = 0, [asignatedCabin] = 0 WHERE [reservationId] = '"&reservationId&"';"
Set rs = conn.execute(query)

Response.Redirect("/admin/reservations")

%>