setInterval(function () {
    $("#time-text").html(moment().format("hh:mm:ss A"));
}, 1000);
