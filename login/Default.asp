<%
user = Request.Cookies("user")
If Len(user) <> 0 Then
  Response.Redirect("/")
  Response.End
End If
%>
<!DOCTYPE html>
<html lang="es">

  <head>
    <meta charset="UTF-8">
    <title>Caguamocabañas | Iniciar Sesión</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../resources/css/normalize.css">
    <link rel="stylesheet" href="../resources/css/main.css">
    <link rel="stylesheet" href="login.css">
  </head>

  <body>
    
    <div class="left-panel">
      <div class="backdrop">
        <a href="/" class="logo">Caguamocabañas</a>
      </div>
    </div>
    <div class="right-panel">
      <main>
        <form action="login.asp" method="post">
          <h1>Iniciar Sesión</h1>
          <div class="input-box">
            <label for="username">Usuario</label>
            <input type="text" name="username" id="username" required>
          </div>
          <div class="input-box">
            <label for="password">Contraseña</label>
            <input type="password" name="password" id="password" required>
          </div>
          <button class="mat-button colorful" type="submit">Iniciar Sesión</button>
        </form>
        <span class="divider">o</span>
        <a class="mat-button" href="/register">Registrar</a>
      </main>
    </div>
    <script src="/resources/js/main.js"></script>
  </body>

</html>
