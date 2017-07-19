<!DOCTYPE html>

<!-- My Vinyl Cafe Page -->

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title> Vinyl Crossing</title>
    <link rel="icon" type="image/png" href="../images/icon.png">
    <link href='https://fonts.googleapis.com/css?family=Muli' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../styles/main.css">
  </head>

  <body>
    <div id="container">

      <nav>
        <ul>
          <li><a href="../">Vinyl Crossing</a></li>
          <li><a href="../whoweare/">Who We Are</a></li>
          <li><a href="../events/">Events</a></li>
          <li><a href="../recordstore/">New Vinyl</a></li>
	        <li><a href="../usedvinyl/">Used Vinyl</a></li>
          <li><a href="../makevinyl/">Make Vinyl</a></li>
          <li><a href="../vinylcommunity/">Community</a></li>
          <li><a href="./">My Vinyl Cafe</a></li>
       

        </ul>
      </nav>

      <figure>
        <img src="../images/allison.jpg" class="banner" width="1200" height="600" alt="vinyl-cafe">
      </figure>

      <main>

        <div id="showtime">
        <?php
        date_default_timezone_set("America/New_York");
        $time = date("H");

        if ($time < "12") {
            echo "Good morning!";
        } elseif ($time < "18") {
            echo "Good afternoon!";
        } else {
            echo "Good evening!";
        }
        ?>
      </div>

        <h1>Discover new vinyls customized just for you<span class="emo"> &#x1F60A;</span></h1>
      </br>
      </br>
        <h1>Your Daily Find</h1>



        <div id="section"></div>
        <p id="info" style="text-align: center;"></p>
        <div id="audio"></div>

        <section>
          <article class="col1">
            <h1>
          </article>
        </section>

      </main>

      <hr>

      <footer>
        <?php include '../footer-source.php'; ?> 
      </footer>
    </div>

        <script src="jquery-1.12.2.min.js"></script>
	      <script src="modernizr-custom.js"></script>
	      <script>
      		$(document).ready(function(){
      			var content = [
        			{image: 'sun.jpg', desc: 'David Bowie - Space Oddity // Ziggy Stardust', music: 'sun.mp3'},
       			 {image: 'mon.jpg', desc: 'Eric Prydz - Generate // Opus', music: 'mon.mp3'},
       			 {image: 'tue.jpg', desc: 'Passion Pit - Lifted Up (1985) // Kindred EP', music: 'tue.mp3'},
       			 {image: 'wed.jpg', desc: 'Bloc Party - The Good News // Hymns', music: 'wed.mp3'},
       			 {image: 'thu.jpg', desc: 'Saint Motel - My Type // My Type EP', music: 'thu.mp3'},
       			 {image: 'fri.jpg', desc: 'DNCE - Cake By The Ocean // Swaay', music: 'fri.mp3'},
       			 {image: 'sat.jpg', desc: 'Queen & David Bowie - Under Pressure // Hot In Space', music: 'sat.mp3'},
      			];

      			var today = new Date();
      			var contentToday = content[today.getDay()];
      			var imageToday = contentToday.image;
      			var musicToday = contentToday.music;
      			var descToday = contentToday.desc;


      			//js pic style
            $('#section')
      				.hide()
      				.html('<center><img src="../images/' + imageToday + '" alt="vinylofday"></center>')
      				.fadeIn(5000);
      			$('#audio').html('<center><audio controls="controls">'+'<source src="music/' + musicToday + '"'+ 'type="audio/mp3"/>'+'</audio></center>');
      			$('#info').text(descToday);


      		});
	      </script>

  </body>
</html>
