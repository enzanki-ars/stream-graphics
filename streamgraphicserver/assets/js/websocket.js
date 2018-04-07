var socket = io.connect('/websocket');
socket.on('response', function (msg) {
    console.info(msg);
});

socket.on('change text', function (msg) {
    console.info('update text ' + msg['item'] + ' ' + msg['value']);

    var curr_val = document.getElementById(msg['item'] + "-text").innerHTML;

    if (curr_val.trim() !== msg['value'].trim()) {
        document.getElementById(msg['item'] + "-text").classList.add("fade-out");


        setTimeout(function () {
            document.getElementById(msg['item'] + "-text").classList.remove("fade-out");

            document.getElementById(msg['item'] + "-text").innerHTML = msg['value'];

            document.getElementById(msg['item'] + "-text").classList.add("fade-in");

            setTimeout(function () {
                document.getElementById(msg['item'] + "-text").classList.remove("fade-in");
            }, 1000);
        }, 1000);
    }


});
socket.on('change bg', function (msg) {
    console.info('update bg ' + msg['item'] + ' ' + msg['value']);

    var curr_val = document.getElementById(msg['item'] + "-bg").classList;

    if (!curr_val.contains(msg['value'])) {
        document.getElementById(msg['item'] + "-bg").className = msg['value'];
    }
});


socket.on('change hide', function (msg) {
    console.info('hide ' + msg['item']);

    var curr_val = document.getElementById(msg['item']).classList;

    if (!curr_val.contains('hide')) {
        document.getElementById(msg['item']).classList.add("fade-out");

        setTimeout(function () {
            document.getElementById(msg['item']).classList.remove("show");
            document.getElementById(msg['item']).classList.add("hide");
            document.getElementById(msg['item']).classList.remove("fade-out");
        }, 1000);
    }
});
socket.on('change show', function (msg) {
    console.info('show ' + msg['item']);
    var curr_val = document.getElementById(msg['item']).classList;

    if (!curr_val.contains('show')) {
        document.getElementById(msg['item']).classList.add("fade-in");

        setTimeout(function () {
            document.getElementById(msg['item']).classList.remove("hide");
            document.getElementById(msg['item']).classList.add("show");
            document.getElementById(msg['item']).classList.remove("fade-in");
        }, 1000);
    }
});
