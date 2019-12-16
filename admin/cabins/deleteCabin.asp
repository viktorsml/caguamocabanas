<%

cabinId = Request.Form("cabinId")

Set conn = Server.CreateObject("ADODB.Connection")
set rs = Server.CreateObject("ADODB.recordset")
conn.ConnectionString = "Provider=SQLOLEDB;Server=VIKTORSML-PC\SQLEXPRESS;database=cabins;uid=sa;pwd=apocohaycontra;"
conn.Open
query = "DELETE FROM [dbo].[Cabins] WHERE [cabinId] = "&cabinId&";"
Set rs = conn.execute(query)

Response.Redirect("/admin/cabins")

%>