<!DOCTYPE html>

<!-- RECORD STORE PAGE -->

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

        main,
        a:focus, a:hover {
          color: #000000;
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
          <li><a href="../events/">Events</a></li>
          <li><a href="./">New Vinyl</a></li>
	        <li><a href="../usedvinyl/">Used Vinyl</a></li>
          <li><a href="../makevinyl/">Make Vinyl</a></li>
          <li><a href="../vinylcommunity/">Community</a></li>
          <li><a href="../vinylcafe/">My Vinyl Cafe</a></li>
   



        </ul>
      </nav>

      <figure>
         <img src="../images/newreleases.jpg" class="banner" width="1200" height="400" alt="new-releases">
      </figure>

      <main>

        <h1>All you want in the vinyl universe and more... </h1>

	<div class="search">
	  <form action="http://www.example.com/search.php">
	  <input type="text" name="search" placeholder="Search our vinyl universe..."/>
	  <input type="submit" value="Search"/>
	  </form>

	</div>


	<h1>Most Popular Vinyl of This Month</h1>


	<section>
          <article class="col">
            <img src="images/untitled.jpg" alt="kendrick-lamar-untitled-unmastered">
            <p>Kendrick Lamar - untitled unmastered.</p>
            <button>Buy Now</button>
          </article>

          <article class="col">
            <img src="images/pimpbutterfly.jpg" alt="kendrick-lamar-to-pimp-a-butter-fly">
            <p>Kendrick Lamar - To Pimp A Butterfly</p>
            <button class="sold-out">Buy <small>(sold out)</small></button>

          </article>

          <article class="col">
            <img src="images/iii.jpg" alt="miike-snow-iii">
            <p>Miike Snow - iii</p>
            <button>Buy Now</button>
          </article>

          <a class="light-switch">Turn lights on/off</a>
	</section>


	<h1 style="padding-top:200px;">SPECIAL SALE</h1>



	<section>
          <article class="col">
            <img src="images/bouquet.jpg" alt="the-chainsmokers-bouquet">
            <p>The Chainsmokers - Bouquet</p>
            <button>Buy Now</button>
          </article>

          <article class="col">
            <img src="images/swaay.jpg" alt="dnce-swaay">
            <p>DNCE - SWAAY</p>
            <button class="sold-out">Buy <small>(sold out)</small></button>

          </article>

          <article class="col">
            <img src="images/opus.jpg" alt="eric-prydz-opus">
            <p>Eric Prydz - Epic 4.0</p>
            <button>Buy Now</button>
          </article>
	</section>


	<h1 style="padding-top:200px;">Fresh Finds</h1>


	<section>
          <article class="col">
            <img src="images/blurryface.jpg" alt="twenty-one-pilots-blurry-face">
            <p>Twenty One Pilots - Blurry Face</p>
            <button class="sold-out">Buy <small>(sold out)</small></button>
          </article>

          <article class="col">
            <img src="images/humanafterall.jpg" alt="daft-punk-human-after-all">
            <p>Daft Punk - Human After All</p>
            <button>Buy Now</button>

          </article>

          <article class="col">
            <img src="images/thenorthborders.jpeg" alt="bonobo-the-north-borders">
            <p>Bonobo - The North Borders</p>
            <button>Buy Now</button>

          </article>
	</section>

      </main>

      <hr>



      <footer>
        <?php include '../footer-source.php'; ?> 
      </footer>
    </div>

    <script src="jquery-1.12.2.min.js"></script>
    <script>
    	$(document).ready(function(){
    		$('button.sold-out').on('click', function(){
    		alert('Sorry, we\'re sold out! Check back in one business week - we update our inventory frequently. You can also email customer service at sz983@nyu.edu to submit a request for a copy.');

    		});

    		$('.light-switch').on('click', function(){
    		$('body').toggleClass('lights-off')		});


    	});
    </script>


  </body>
</html>
