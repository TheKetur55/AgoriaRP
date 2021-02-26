$(function(){
	window.onload = function(e){
		window.addEventListener('message', function(event){
			audioPlayer = new Audio("sound/music.ogg");
			audioPlayer.volume = 0.3;
			audioPlayer.play();
			var item = event.data;
			if (item !== undefined && item.type === "disclaimer") {

				if (item.display === true) {
					$('#disclaimer').delay(1000).fadeIn( "slow" );
				} else if (item.display === false) {
					$('#disclaimer').fadeOut( "slow" );
					audioPlayer.pause();
				}
			}
		});

	};
});





