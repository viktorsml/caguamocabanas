<%

userToModify = Request.Form("username")

Set conn = Server.CreateObject("ADODB.Connection")
set rs = Server.CreateObject("ADODB.recordset")
conn.ConnectionString = "Provider=SQLOLEDB;Server=VIKTORSML-PC\SQLEXPRESS;database=cabins;uid=sa;pwd=apocohaycontra;"
conn.Open
query = "UPDATE [dbo].[Users] SET [type]=1 WHERE [username] = '"&userToModify&"';"
Set rs = conn.execute(query)

Response.Redirect("/admin/users")

%>