<!DOCTYPE html>

<html>
  <head>
    <meta charset="UTF-8">
    <title>Vinyl Crossing Subscription</title>
    <link rel="icon" type="image/png" href="images/icon.png">
    <link href='https://fonts.googleapis.com/css?family=Muli' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="styles/main.css">
  </head>
  
  <body>
    <?php
      // initialize variables
      $firstname = '';
      $lastname = '';
      $email = '';
     

      function validate_input($data) {
        $data = trim($data); // remove extra whitespace
        $data = stripslashes($data); // removes backslash characters
        $data = htmlspecialchars($data); // escape special characters
        return $data;
      }

      if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $firstname = validate_input($_POST["firstname"]);
        $lastname = validate_input($_POST["lastname"]);
        $email = validate_input($_POST["email"]);
        
        // write file in append mode
        $subscribers = fopen("data/subscribers.csv", "a") or exit("Sorry, unable to open file");
        $info = $firstname . "," . $lastname . "," . $email . "\r\n";
        fwrite($subscribers, $info);
        fclose($subscribers); 
      }
    ?>

    <p>Thanks, <?php echo $firstname; ?>!</p>
    <p>You are now subscribed at: <?php echo $email; ?></p>
    <a href="./" style="color: black;"><u>Go Back to Main Page</u></a>
  </body>
</html>