<%
user = Request.Cookies("user")
If Len(user) = 0 Then
  Response.Redirect("/login")
  Response.End
End If
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
    <link rel="stylesheet" href="../resources/css/normalize.css">
    <link rel="stylesheet" href="../resources/css/main.css">
    <link rel="stylesheet" href="book-now.css">
  </head>

  <body>
    <!--#include virtual="/resources/includes/header.inc"-->
    <%
    If CInt(userType) = 1 Then
      Response.Redirect("/admin")
      Response.End
    End If
    %>

    <form action="book.asp" method="post" class="responsiveContainer">
      <h1>Haz tu reservación</h1>
      <div id="stepOne">
        <h2 class="divider"><strong>Paso 1)</strong> Selecciona tus fechas y número de
          acompañantes</h2>
        <div class="flex-row">
          <div class="input-box">
            <label for="checkIn">Check-In</label>
            <input type="date" name="checkIn" id="checkIn" required>
          </div>
          <div class="input-box">
            <label for="checkOut">Check-Out</label>
            <input type="date" name="checkOut" id="checkOut" required>
          </div>
        </div>
        <div class="flex-row people">
          <div class="input-box">
            <label for="people">No. de personas</label>
            <input type="number" name="people" id="people" min="1" max="10" required>
          </div>
        </div>
      </div>

      <div id="stepTwo">
        <h2 class="divider"><strong>Paso 2)</strong> Selecciona la cabaña</h2>
        <div class="flex-row">
          <div class="cabin-card">
            <div class="cabin-image image-classic"></div>
            <ul class="cabin-info">
              <li class="capacity">Capacidad de hasta 2 personas</li>
              <li class="price"><strong>$1,200 MXN</strong> por noche</li>
            </ul>
            <div class="cabin-radio">
              <input type="radio" name="cabinType" id="cabinClassic" value="0" required>
              <label for="cabinClassic">Cabaña Clásica</label>
            </div>
          </div>
          <div class="cabin-card">
            <div class="cabin-image image-friends"></div>
            <ul class="cabin-info">
              <li class="capacity">Capacidad de hasta 5 personas</li>
              <li class="price"><strong>$1,700 MXN</strong> por noche</li>
            </ul>
            <div class="cabin-radio">
              <input type="radio" name="cabinType" id="cabinFriends" value="1" required>
              <label for="cabinFriends">Cabaña Amigos</label>
            </div>
          </div>
          <div class="cabin-card">
            <div class="cabin-image image-family"></div>
            <ul class="cabin-info">
              <li class="capacity">Capacidad de hasta 10 personas</li>
              <li class="price"><strong>$2,500 MXN</strong> por noche</li>
            </ul>
            <div class="cabin-radio">
              <input type="radio" name="cabinType" id="cabinFamily" value="2" required>
              <label for="cabinFamily">Cabaña Familiar</label>
            </div>
          </div>
        </div>
      </div>

      <div id="stepThree">
        <h2 class="divider"><strong>Paso 3)</strong> Confirma tu reservación</h2>
        <p id="totalCostText">El costo total de tu hospedaje será de $<strong id="totalCost"></strong> MXN</p>
        <div class="flex-row">
          <button type="submit" class="mat-button colorful">Hacer reservación</button>
        </div>
      </div>
    </form>
    <script src="/resources/js/main.js"></script>
    <script src="/resources/js/moment.js"></script>
    <script src="book-now.js"></script>
  </body>

</html>
