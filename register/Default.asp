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
    <title>Caguamocabañas | Registro</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <link rel="stylesheet" href="../resources/css/normalize.css">
    <link rel="stylesheet" href="../resources/css/main.css">
    <link rel="stylesheet" href="../login/login.css">
  </head>

  <body>
    <div class="left-panel">
      <div class="backdrop">
        <a href="/" class="logo">Caguamocabañas</a>
      </div>
    </div>
    <div class="right-panel">
      <main>
        <form action="register.asp" id="registerForm" method="post">
          <h1>Registro</h1>
          <div class="input-box">
            <label for="name">Nombre</label>
            <input type="text" name="name" id="name" required>
          </div>
          <div class="input-box">
            <label for="last-name">Apellidos</label>
            <input type="text" name="last-name" id="last-name" required>
          </div>
          <div class="input-box">
            <label for="username">Usuario</label>
            <input type="text" name="username" id="username" required>
          </div>
          <div class="input-box">
            <label for="password">Contraseña</label>
            <input type="password" name="password" id="password" required>
          </div>
          <div class="input-box">
            <label for="password-repeat">Contraseña</label>
            <input type="password" name="password-repeat" id="password-repeat"
              required>
          </div>
          <div class="input-box">
            <label for="phone">Telefono</label>
            <input type="tel" pattern="[0-9]{10}" name="phone" id="phone" required>
          </div>
          <div class="input-box">
            <label for="rfc">RFC</label>
            <input type="text" name="rfc" id="rfc" required>
          </div>
          <div class="input-box">
            <label for="sex">Sexo</label>
            <select name="sex" id="sex" required>
              <option value="0">Hombre</option>
              <option value="1">Mujer</option>
            </select>
          </div>
          <div class="input-box">
            <label for="age">Edad</label>
            <input type="number" name="age" id="age" required>
          </div>
          <div class="input-box">
            <label for="address">Dirección</label>
            <input type="text" name="address" id="address" required>
          </div>
          <button class="mat-button colorful" type="submit">Registrar</button>
        </form>
        <span class="divider">o</span>
        <a class="mat-button" href="/login">Iniciar Sesión</a>
      </main>
    </div>
    <script src="/resources/js/main.js"></script>
    <script src="register.js"></script>
  </body>

</html>
