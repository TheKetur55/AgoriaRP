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
    $.post('http://ktr_lspdweb/escape_pressed', '{}');
    break;
  }

  }

});

window.addEventListener('keyup', (e) => {

  switch(e.keyCode) {

    case 27: {
      $.post('http://ktr_lspdweb/escape_pressed', '{}');
      break;
    }

  }

});


// Handle Button Presses

$(".btnClose").click(function(){
    $.post('http://ktr_lspdweb/close', JSON.stringify({}));
});
$(".btnKick").click(function(){
    $.post('http://ktr_lspdweb/kick', JSON.stringify({}));
});

function clickButton(event) {
   $.post('http://ktr_lspdweb/'+event, JSON.stringify({}));
}
