<html>
  <head>
    <title>The game of Lorem</title>
    <link href="./css/style.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="./js/jquery-3.1.1.js"></script>
    <script type="text/javascript" src="./js/script.js"></script>
  </head>
  <body>
  	<section id="init">
  		    <p>Quel est ton nom ?</p>
  		    <input id="name"><br>
  		    <button onclick="enterTheGame()">Entrer dans le jeu</button>
	</section>
	<section id="question">
  </section>
  <footer style="display: none;">
      <hr>
      <p><span id="name"></span>, vous avez <span id="points"></span> points !</p>
      <p>Question : <span id="questionNumber"></span>/20</p>
  </footer>
  </body>
</html>