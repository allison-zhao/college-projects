//JS: Vinyl of the day
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

var section = document.getElementById('section');
section.innerHTML = '<center><img src="../images/' + imageToday + '" alt="vinylofday"></center>';

var audio = document.getElementById('audio');
audio.innerHTML = '<center><audio controls="controls">'+'<source src="music/' + musicToday + '"'+ 'type="audio/mp3"/>'+'</audio></center>';

function showInfo() {
  // Access the <p> element of ID "weather"
  var elInfo = document.getElementById('info');
  // Update element content
  elInfo.textContent = descToday;
}
showInfo();
