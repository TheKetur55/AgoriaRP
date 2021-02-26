var documentWidth = document.documentElement.clientWidth;
var documentHeight = document.documentElement.clientHeight;

var cursor = document.getElementById("cursor");
var cursorX = documentWidth / 2;
var cursorY = documentHeight / 2;

function UpdateCursorPos() {
    cursor.style.left = cursorX;
    cursor.style.top = cursorY;
}

function Click(x, y) {
    var element = $(document.elementFromPoint(x, y));
    element.focus().click();
}

$(function() {
    window.addEventListener('message', function(event) {
        if (event.data.type == "enableui") {
            cursor.style.display = event.data.enable ? "block" : "none";
            document.body.style.display = event.data.enable ? "block" : "none";
        } else if (event.data.type == "click") {
            // Avoid clicking the cursor itself, click 1px to the top/left;
            Click(cursorX - 1, cursorY - 1);
        }
    });

    $(document).mousemove(function(event) {
        cursorX = event.pageX;
        cursorY = event.pageY;
        UpdateCursorPos();
    });

    /*document.onkeyup = function (data) {
        if (data.which == 27) { // Escape key
            $.post('http://esx_identity/escape', JSON.stringify({}));
        }
    };*/

    $('#dateofbirth').on('keypress', function (event) {
        var regex = new RegExp("^[0-9]+$");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
           event.preventDefault();
           return false;
        }

        if($("#dateofbirth").val().length == 2)
            $("#dateofbirth").val($("#dateofbirth").val() + "-");

        if($("#dateofbirth").val().length == 5)
            $("#dateofbirth").val($("#dateofbirth").val() + "-");

        if($("#dateofbirth").val().length == 10) {
           event.preventDefault();
           return false;
        }
    });

    $('#sex').on('keypress', function (event) {
        var key = !event.charCode ? event.which : event.charCode;
        //if (key != 70 && key != 77 && key != 8) {
        if (key != 70 && key != 72 && key != 16 && key != 8) {
           event.preventDefault();
           return false;
        }

        if(key != 8 && $("#sex").val().length == 1) {
           event.preventDefault();
           return false;
        }
    });

    $('#height').on('keypress', function (event) {
        var regex = new RegExp("^[0-9]+$");
        var key = String.fromCharCode(!event.charCode ? event.which : event.charCode);
        if (!regex.test(key)) {
           event.preventDefault();
           return false;
        }

        if($("#height").val().length == 3) {
           event.preventDefault();
           return false;
        }
    });
	
    $("#register").submit(function(e) {
        e.preventDefault(); // Prevent form from submitting

        $("#firstname").removeClass("error");
        $("#lastname").removeClass("error");
        $("#dateofbirth").removeClass("error");
        $("#height").removeClass("error");
        $("#sex").removeClass("error");

        var err = false;
        var patt = new RegExp("^[a-zA-Z\-é]+$");
        var patt_bd = new RegExp("^[0-9]{2}\-[0-9]{2}\-[0-9]{4}$");

        if(!$("#firstname").val() || !patt.test($("#firstname").val())) {
            $("#firstname").addClass("error");
            err = true;
        }

        if(!$("#lastname").val() || !patt.test($("#lastname").val())) {
            $("#lastname").addClass("error");
            err = true;
        }

        if(!$("#dateofbirth").val() || !patt_bd.test($("#dateofbirth").val())) {
            $("#dateofbirth").addClass("error");
            err = true;
        }

        if(!$("#sex").val() || $("#sex").val() != 'H' && $("#sex").val() != 'F') {
            $("#sex").addClass("error");
            err = true;
        }

        if(!$("#height").val() || !$.isNumeric($("#height").val()) || $("#height").val() < 140 || $("#height").val() > 220) {
            $("#height").addClass("error");
            err = true;
        }
        
        if(!err) {
            $.post('http://esx_identity/register', JSON.stringify({
                firstname: $("#firstname").val(),
                lastname: $("#lastname").val(),
                dateofbirth: $("#dateofbirth").val(),
                sex: $("#sex").val(),
                height: $("#height").val()
            }));
        }
    });
});
