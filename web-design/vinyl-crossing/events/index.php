<!DOCTYPE html>

<!-- EVENTS PAGE -->

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title> Vinyl Crossing</title>
    <link rel="icon" type="image/png" href="../images/icon.png">
    <link href='https://fonts.googleapis.com/css?family=Muli' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="../styles/main.css">
    <style>
      body {
        background-color: #e9ece5;
        }

      nav {
        background: #ffcc00;
        }

        main, a:link{
          color:#000000;
        }

        a:focus, a:hover {
          color: #ffffff;
        }

        h1,
        p{
          color: inherit;
          text-align: center;
        }

        section{
	  clear:both;
	  padding-bottom:400px;
        }

        .col{
          width:33%;
          box-sizing:border-box;
          padding:20px 15px;
          text-align: center;

        }
        .col img {
          max-width: 100%;
          height: auto;
        }

        body.lights-off,
        body.lights-off main {
          background: black;
          color: white;
        }

        .light-switch {
          background: #e9ece5;
          bottom: 10px;
          color: black;
          display: inline-block;
          padding: 5px;
          position: fixed;
          right: 10px;
        }
        .light-switch:hover,
        .light-switch:active,
        .light-switch:focus {
          cursor: pointer;
          text-decoration: underline;
        }

        	.search{
        	  text-align:right;
        	  padding-bottom: 20px;
        	  padding-top:20px;
        	  padding-right:30px;
        	}


    </style>

  </head>

  <body>
    <div id="container">

      <nav>
        <ul>

          <li><a href="../">Vinyl Crossing</a></li>
          <li><a href="../whoweare/">Who We Are</a></li>
          <li><a href="./">Events</a></li>
          <li><a href="../recordstore/">New Vinyl</a></li>
	        <li><a href="../usedvinyl/">Used Vinyl</a></li>
          <li><a href="../makevinyl/">Make Vinyl</a></li>
          <li><a href="../vinylcommunity/">Community</a></li>
          <li><a href="../vinylcafe/">My Vinyl Cafe</a></li>
  




        </ul>
      </nav>

      <figure>
         <img src="images/event1.png" class="banner" width="1200" height="400" alt="event-1">
         <img src="images/event2.png" class="banner" width="1200" height="400" alt="event-2">
      </figure>

      

        <h1>Yep, Kanye is coming to sign your <i>Life of Pablo</i> vinyl at Hilton NYC. <a href="..."><i><u>RSVP NOW</u></i></a></h1>
        <figure>        
          <img src="images/kanye.jpg" class="banner" width="1200" height="400" alt="kanye">
        </figure>


	  <div class="search">
	  <form action="http://www.example.com/search.php">
	  <input type="text" name="search" placeholder="Search events..."/>
	  <input type="submit" value="Search"/>
	  </form>

	</div>

<main>
  <a class="light-switch">Turn lights on/off</a>

	<h1><u>IRL Crossing Events</u></h1>
	<h1 style="padding-top:50px;"><u>Vinyl Listening Parties</u></h1>
	<h1 style="padding-top:50px;"><u>Vinyl Crossing Present: Shows</u></h1>


      </main>

      <hr>



      <footer>
        <?php include '../footer-source.php'; ?> 
      </footer>
    </div>

    <script src="jquery-1.12.2.min.js"></script>
    <script>

      		$('.light-switch').on('click', function(){
      		$('body').toggleClass('lights-off')		});


      	};
    </script>


  </body>
</html>
