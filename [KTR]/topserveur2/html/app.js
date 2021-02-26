window.addEventListener('message', (e) => {

  switch(e.data.action) {

    case 'show' : {
      $(document.body).show();
      break;
    }

    case 'hide' : {
      $(document.body).hide();
      break;
    }

	case 'escape_pressed' : {
	  $.post('http://topserveur2/escape_pressed', '{}');
	  break;
	}

  }

});

window.addEventListener('keyup', (e) => {

  switch(e.keyCode) {

    case 27: {
      $.post('http://topserveur2/escape_pressed', '{}');
      break;
    }

  }

});


// Handle Button Presses

$(".btnClose").click(function(){
    $.post('http://topserveur2/close', JSON.stringify({}));
});
$(".btnKick").click(function(){
    $.post('http://topserveur2/kick', JSON.stringify({}));
});

function clickButton(event) {
   $.post('http://topserveur2/'+event, JSON.stringify({}));
}
