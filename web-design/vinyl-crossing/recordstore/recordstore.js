window.addEventListener('load', function() {
  var buttons = document.querySelectorAll('button.sold-out');
  //looping through all sold out buttons
  for (var i = 0, j = buttons.length; i<j; i++) {
    buttons[i].addEventListener('click', function() {
      alert('Sorry, we\'re sold out! Check back in one business week - we update our inventory frequently. You can also email customer service at sz983@nyu.edu to submit a request for a copy.');
    }, false);
  }

//lightSwitch function
  var lightSwitch = document.querySelector('.light-switch');
  lightSwitch.addEventListener('click', function() {
    document.body.classList.toggle('lights-off');
  }, false);

}, false);


//press key for questions/customer service
window.addEventListener('keypress', function(e) {
	var key = e.keyCode;
	if (key == 113 || key == 81 ){
    alert("Please contact Customer Service at sz983@nyu.edu for any questions or concerns :)");
  }

}, false);
