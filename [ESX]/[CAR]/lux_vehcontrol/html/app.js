var audioPlayer = null;
window.addEventListener('message', function(e) {
	$("#container").stop(false, true);
    if (e.data.displayWindow == 'true') {
        $("#container").css('display', 'flex');
  		
        $("#container").animate({
        	bottom: "25%",
        	opacity: "1.0"
        	},
        	700, function() {
			
        });
	  if (audioPlayer != null) {
		audioPlayer.pause();
		audioPlayer.currentTime = 0;
	  }
	  audioPlayer = new Audio("./sound/SeatBelt.ogg");
	  audioPlayer.volume = 0.03;
	  audioPlayer.play();
	  audioPlayer.loop = true;

    } else {
    	$("#container").animate({
        	bottom: "-50%",
        	opacity: "0.0"
        	},
        	700, function() {
        		$("#container").css('display', 'none');
	         	
        });
		audioPlayer.pause();
    }
});

