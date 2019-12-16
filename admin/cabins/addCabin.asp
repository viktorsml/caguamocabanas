<%

cabinNumber = Request.Form("cabinNumber")
cabinType = Request.Form("cabinType")
cabinPrice = Request.Form("cabinPrice")

Set conn = Server.CreateObject("ADODB.Connection")
set rs = Server.CreateObject("ADODB.recordset")
conn.ConnectionString = "Provider=SQLOLEDB;Server=VIKTORSML-PC\SQLEXPRESS;database=cabins;uid=sa;pwd=apocohaycontra;"
conn.Open
query = "INSERT INTO [dbo].[Cabins] ([number], [type], [status], [cost]) VALUES ("&cabinNumber&", "&cabinType&", 0, "&cabinPrice&");"
Set rs = conn.execute(query)

Response.Redirect("/admin/cabins")

%>