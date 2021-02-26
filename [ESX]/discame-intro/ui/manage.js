$(function(){
	window.onload = (e) => {
		window.addEventListener('message', (event) => {
			var data = event.data;
			if (data !== undefined && data.element === "splashspawn") {

				if (data.display === true) {
					$("#splashSpawn").append("<audio id='music' autoplay=''><source src='assets/music.mp3' type='audio/mp3'></audio>");
					$("#splashSpawn h2").text(data.text);
					$("#splashSpawn").addClass("fade");
					$("#splashSpawn").show();
				} else{
					$("#music").remove();
					$("#splashSpawn").removeClass("fade");
					$("#splashSpawn").hide();
              		}
			}
		});
	};
});