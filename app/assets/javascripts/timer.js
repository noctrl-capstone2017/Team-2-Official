window.onload = function () {
  //Add JAlert prompt http://labs.abeautifulsite.net/archived/jquery-alerts/demo/
  var durationDivs = document.getElementsByClassName("durationDiv");
  var timerSquares = [];
  for (var i = 0; i < durationDivs.length; i++)
  {
	  var timerSquare = new Object();
	  timerSquare.Interval;
	  timerSquare.durationLog =  durationDivs[i].querySelector(".durationLog");
	  timerSquare.buttonStart =  durationDivs[i].querySelector((".button-start"));
	  timerSquare.tensTxt = durationDivs[i].querySelector("#tens");
	  timerSquare.secondsTxt = durationDivs[i].querySelector("#seconds");
	  timerSquare.minutesTxt = durationDivs[i].querySelector("#minutes");
	  timerSquare.tens = 00;
	  timerSquare.seconds = 00;
	  timerSquare.minutes = 00;
	  timerSquares.push(timerSquare);
  }
  
  for(var i = 0; i < timerSquares.length; i++)
  {
	  ts = timerSquares[i];
	  timerSquares[i].buttonStart.onclick = beginTimer.bind(this, ts);
  }
  
  var buttonCount = document.getElementById('counter');
  var countLabel = document.getElementById('count')
  
  buttonCount.onclick = function(){count(countLabel)};
  
  function count(cLabel)
  {
	cLabel.innerText = (parseInt(countLabel.innerText) + 1);  
  }

  function beginTimer(timerSq) 
  {
     clearInterval(timerSq.Interval);
	 timerSq.Interval = setInterval(function(){startTimer(timerSq)}, 10);
	 timerSq.buttonStart.onclick = function(){stopTimer(timerSq)};
	 timerSq.buttonStart.style.backgroundColor = "red";
	 
  }
  
  function stopTimer(timerSq)
  {
      clearInterval(timerSq.Interval);
	  timerSq.durationLog.innerHTML += timerSq.minutesTxt.innerHTML + ":" + timerSq.secondsTxt.innerHTML + ":" + timerSq.tensTxt.innerHTML + "," + timeStamp() + "\n" ;
	  resetTimer(timerSq);
	  timerSq.buttonStart.onclick = function(){beginTimer(timerSq)};
	  timerSq.buttonStart.style.backgroundColor = "limegreen";
  }
  

  function resetTimer(timerSq)
  {
     clearInterval(timerSq.Interval);
     timerSq.tens = "00";
  	 timerSq.seconds = "00";
	 timerSq.minutes = "00";
     timerSq.tensTxt.innerHTML = timerSq.tens;
  	 timerSq.secondsTxt.innerHTML = timerSq.seconds;
	 timerSq.minutesTxt.innerHTML = timerSq.minutes;
  }
  
   
  
  function startTimer (timerSq)
  {
	var tens = timerSq.tens;
	var seconds = timerSq.seconds;
	var minutes = timerSq.minutes;
    tens++; 
    
    if(tens < 9)
	{
      timerSq.tensTxt.innerHTML = "0" + tens;
    }
    
    if (tens > 9)
	{
      timerSq.tensTxt.innerHTML = tens;
      
    } 
    
    if (tens > 99)
	{
      seconds++;
      timerSq.secondsTxt.innerHTML = "0" + seconds;
      tens = 0;
      timerSq.tensTxt.innerHTML = "0" + 0;
    }
    
    if (seconds > 9)
	{
      timerSq.secondsTxt.innerHTML = seconds;
    }
	if(seconds > 59)
	{
		minutes++;
		timerSq.minutesTxt.innerHTML = minutes;
		seconds = 0;
		timerSq.secondsTxt.innerHTML = "0" + 0;
	}
	timerSq.tens = tens;
	timerSq.seconds = seconds;
	timerSq.minutes = minutes;
  }

}

function timeStamp() {
// Create a date object with the current time
  var now = new Date();

// Create an array with the current month, day and time
  var date = [ now.getMonth() + 1, now.getDate(), now.getFullYear() ];

// Create an array with the current hour, minute and second
  var time = [ now.getHours(), now.getMinutes(), now.getSeconds() ];

// Determine AM or PM suffix based on the hour
  var suffix = ( time[0] < 12 ) ? "AM" : "PM";

// Convert hour from military time
  time[0] = ( time[0] < 12 ) ? time[0] : time[0] - 12;

// If hour is 0, set it to 12
  time[0] = time[0] || 12;

// If seconds and minutes are less than 10, add a zero
  for ( var i = 1; i < 3; i++ ) {
    if ( time[i] < 10 ) {
      time[i] = "0" + time[i];
    }
  }

// Return the formatted string
  return date.join("/") + " " + time.join(":") + " " + suffix;
}