window.addEventListener('message', function(event) {

    let wallet = event.data.wallet;
    let blackMoney = event.data.black_money;
    let bank = event.data.bank;
    let label = event.data.label;
    let society = event.data.society;
    let control = event.data.control;

    $("#label").text(label);
    $("#bank").text(bank);
    $("#wallet").text(wallet);
    $("#blackMoney").text(blackMoney);
    $("#society").text(society);

    let display = false;


    if (event.data.control === 'f3' && display === false) {

        display = true;
        $('#wrapperHUD').animate({
                marginLeft: "-8px",
                opacity: "1.0"
            },
            900,
            function() {

            });
        window.setTimeout(function() {
            $('#bank, #label, #wallet, #blackMoney, #society').fadeIn(1100);
        }, 900);

        window.setTimeout(function() {
            display = false;
            $('#wrapperHUD').animate({
                    marginLeft: "-20vw",
                    opacity: "0"
                },
                900,
                function() {

                });
            window.setTimeout(function() {
                $('#bank, #label, #wallet, #blackMoney, #society').fadeOut(900);
            }, 900);

        }, 5500)
    }

});