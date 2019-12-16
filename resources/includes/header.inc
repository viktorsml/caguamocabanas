
<%
Dim connType
Dim rsType
Dim userType

Set connType = Server.CreateObject("ADODB.Connection")
set rsType = Server.CreateObject("ADODB.recordset")
connType.ConnectionString = "Provider=SQLOLEDB;Server=VIKTORSML-PC\SQLEXPRESS;database=cabins;uid=sa;pwd=apocohaycontra;"
connType.Open
usr = Request.Cookies("user")
query = "SELECT [type] FROM [dbo].[Users] WHERE [username] = '"&usr&"'"
Set rsType = connType.execute(query)

If rsType.EOF Then
Else
  Set userType = rsType("type")
End If

%>

<header>
  <a href="/" class="logo">Caguamocabañas</a>
  <nav>
    <ul>
      <li><a href="/" class="cabin-switcher mat-button" data-slide="1">Cabaña Clasica</a></li>
      <li><a href="/" class="cabin-switcher mat-button" data-slide="2">Cabaña Amigos</a></li>
      <li><a href="/" class="cabin-switcher mat-button" data-slide="3">Cabaña Familiar</a></li>
    </ul>
  </nav>
  <%
  user = Request.Cookies("user")
  If Len(user) = 0 Then
    Response.Write("<a class=""login mat-button"" href=""/login"">Iniciar Sesión</a>")
    Response.Write("<a class=""register mat-button linear"" href=""/register"">Registro</a>")
  Else
    Response.Write("<a id=""user"" class=""mat-button linear"" href=""#"">"&user&"</a>")
    Response.Write("<ul id=""dropdownUser"">")
    If CInt(userType) = 0 Then
      Response.Write("<li><a href=""/my-reservations"">Mis reservaciones</a></li>")
    End If
    If CInt(userType) = 1 Then
      Response.Write("<li><a href=""/admin"">Panel de control</a></li>")
    End If
    Response.Write("<li id=""closeSession""><a href=""#"">Cerrar Sesión</a></li>")
    Response.Write("</ul>")
  End If
  %>
</header>
