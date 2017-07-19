<!DOCTYPE html>

<!-- MAIN PAGE -->

<html lang="en">
  <head>
    <meta charset="utf-8">
    <title> Vinyl Crossing</title>
    <link rel="icon" type="image/png" href="images/icon.png">
    <link href='https://fonts.googleapis.com/css?family=Muli' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="styles/main.css">

  </head>

  <body>
    <div id="container">

      <nav>
        <ul>
          <li><a href="./">Vinyl Crossing</a></li>
          <li><a href="whoweare/">Who We Are</a></li>
          <li><a href="events/">Events</a></li>
          <li><a href="recordstore/">New Vinyl</a></li>
	        <li><a href="usedvinyl/">Used Vinyl</a></li>
          <li><a href="makeyvinyl/">Make Vinyl</a></li>
          <li><a href="vinylcommunity/">Community</a></li>
          <li><a href="vinylcafe/">My Vinyl Cafe</a></li>
          

        </ul>
      </nav>

      <figure>
        <img src="images/vinylfigure.jpg" class="banner" width="1200" height="400" alt="vinyl-figure">
      </figure>



        <h1>We agree, it just sounds better with vinyl.</h1>
	      <img src="images/logo1re.png" alt="logo" class="logo">


	<main>

        <section>
          <article class="col1">
	          <h2>NEWS</h2>
            <h2>Sufjan Stevens Illinois 10th Anniversary Limited Vinyl Reissue</h2>
            <p>To celebrate the 10th anniversary of Sufjan Steven's Illinois the album is being reissued as a limited edition blue and white 2XLP! This is set to release for April 1st.</p>

	          <h2>Red Hot Chili Pepper Vinyl Reissues - "Greatest Hits", "I'm With You" and "Stadium Arcadium"</h2>
	          <p>Three Red Hot Chili Pepper titles are being reissued on vinyl for a February 26th  release date - "Peppers Greatest Hits" on silver vinyl, "Stadium Arcadium" and "I'm With You".</p>
	        </article>

          <article class="col2">
            <h2>LATEST EVENTS</h2>
            <ul class="elist">
		            <li><a href="http://i6.cims.nyu.edu/~sz983/vinylcrossing/">//April 15// Indie Lover Night: Vinyl Crossing X Knitting Factory</a></li>
	              <li><a href="http://i6.cims.nyu.edu/~sz983/vinylcrossing/">//May 27// Moscot Presents: Vinyl Crossing X The Strumbellas</a></li>
		            <li><a href="http://i6.cims.nyu.edu/~sz983/vinylcrossing/">//July 3// Spotify House: Vinyl Crossing X Weezer</a></li>
                <li><a href="http://i6.cims.nyu.edu/~sz983/vinylcrossing/">//July 9// Dance Rock Is Still Alive: Listening Party with DNCE | NYC </a></li>

	          </ul>

          </article>

          <article class="col2">
              <h2>WHAT'S BUZZING</h2>
              <ul class="elist">
                <li><a href="http://i6.cims.nyu.edu/~sz983/vinylcrossing/">//Hiring on-site staff at Urban Outfitters! Click Here to learn more </a></li>
                <li><a href="http://i6.cims.nyu.edu/~sz983/vinylcrossing/">//See video of Gin Wigmore's surprise performance at our office! </a></li>
                <li><a href="http://i6.cims.nyu.edu/~sz983/vinylcrossing/">//Crowd-Funding: Have Twenty One Pilots sign your new vinyl!</a></li>
              </ul>

          </article>


        </section>


        <section class="signup">
          <h1>Sign up with us! (and get exclusive early bird gift package)</h1>
          <form action="subscribe.php" method="post">
                <label for="firstname">First Name</label>
                <br>
                <br>
                <input type="text" name="firstname" required>
                <br>
                <br>
                <label for="lastname">Last Name</label>
                <br>
                <br>
                <input type="text" name="lastname" required>
                <br>
                <br>
                <label for="email">Email</label>
                <br>
                <br>
                <input type="email" name="email" required>
                <br>
                <br>
                <input type="submit" value="Submit">
          </form>


        </section>

      </main>

      <hr>

      <footer>
        <?php include 'footer-source.php'; ?> 
      </footer>
    </div>

    <script src="form-validation.js"></script>   
  </body>
</html>
