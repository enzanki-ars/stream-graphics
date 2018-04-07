var socket = io.connect('/websocket');
socket.on('online', function (msg) {
    console.info('online');
    updateAll(msg);
});
socket.on('response', function (msg) {
    console.info(msg);
});
socket.on('change text', function (msg) {
    console.info('update text ' + msg['item'] + ' ' + msg['value']);

    updateText(msg['item'], msg['value']);
});
socket.on('change bg', function (msg) {
    console.info('update bg ' + msg['item'] + ' ' + msg['value']);

    updateBG(msg['item'], msg['value']);
});
socket.on('change hide', function (msg) {
    console.info('hide ' + msg['item']);

    hide(msg['item']);
});
socket.on('change show', function (msg) {
    console.info('show ' + msg['item']);
    show(msg['item']);
});

function updateAll(msg) {
    for (const item in msg) {
        if ('text' in msg[item]) {
            updateText(item, msg[item]['text']);
        }
        if ('bg' in msg[item]) {
            updateBG(item, msg[item]['bg']);
        }
        if ('display' in msg[item]) {
            if (msg[item]['display'] === 'show') {
                show(item)
            } else {
                hide(item)
            }
        }
    }
}

function updateText(item, value) {
    var curr_val = document.getElementById(item + "-text").innerHTML;

    if (curr_val.trim() !== value.trim()) {
        document.getElementById(item + "-text").classList.add("fade-out");


        setTimeout(function () {
            document.getElementById(item + "-text").classList.remove("fade-out");

            document.getElementById(item + "-text").innerHTML = value;

            document.getElementById(item + "-text").classList.add("fade-in");

            setTimeout(function () {
                document.getElementById(item + "-text").classList.remove("fade-in");
            }, 1000);
        }, 1000);
    }
}

function updateBG(item, value) {
    var curr_val = document.getElementById(item + "-bg").classList;

    if (!curr_val.contains(value)) {
        document.getElementById(item + "-bg").className = value;
    }
}

function hide(item) {
    var curr_val = document.getElementById(item).classList;

    if (!curr_val.contains('hide')) {
        document.getElementById(item).classList.add("fade-out");

        setTimeout(function () {
            document.getElementById(item).classList.remove("show");
            document.getElementById(item).classList.add("hide");
            document.getElementById(item).classList.remove("fade-out");
        }, 1000);
    }
}

function show(item) {
    var curr_val = document.getElementById(item).classList;

    if (!curr_val.contains('show')) {
        document.getElementById(item).classList.add("fade-in");

        setTimeout(function () {
            document.getElementById(item).classList.remove("hide");
            document.getElementById(item).classList.add("show");
            document.getElementById(item).classList.remove("fade-in");
        }, 1000);
    }
}
