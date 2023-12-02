function display(bool) {
    if(bool) {
        $("body").show();
    } else {
        $("body").hide();
    }
}

window.onload = function() {
    display(false)
}

function CardPay() {
    $.post('https://ps_revive_station/cardpay', JSON.stringify({
        PlayerID: $("#revive-idbox").val(),
        PaymentType: 'card'
    }));
}

function CashPay() {
    $.post('https://ps_revive_station/cashpay', JSON.stringify({
        PlayerID: $("#revive-idbox").val(),
        PaymentType: 'cash'
    }));
}

window.addEventListener('message', function(event) {
    var item = event.data
    if(item.type == "ui") {
        display(item.status)
    }
})

$(document).on('click', '.revive-style-close', function(){
    $.post('https://ps_revive_station/exit', JSON.stringify({}))
});

document.onkeyup = function(data) {
    if(data.which == 27) {
        $.post('https://ps_revive_station/exit', JSON.stringify({}))
        return
    }
};