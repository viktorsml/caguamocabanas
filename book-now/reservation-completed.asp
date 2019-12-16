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
    <div class="responsiveContainer">
      <div class="imageContainer">
        <img src="/resources/svg/sended.svg" alt="¡Reservación Enviada!" width="100px">
      </div>
      <h1 class="alternativeTitleMargin">¡Reservación enviada!</h1>
      <p class="textConfirmation">Ahora solamente tienes que esperar a que se confirme tu reservación. Recuerda
        que siempre puedes revisar el estado de tu reservación el la pagina de <a
          href="/my-reservations">Mis reservaciones</a></p>
    </div>
    <script src="/resources/js/main.js"></script>
  </body>

</html>
