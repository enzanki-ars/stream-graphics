var socket = io.connect('/websocket');

socket.on('connect', function () {
    console.info('connect');
});
socket.on('reconnect', function (attemptNumber) {
    console.info('reconnect');
});
socket.on('connect_timeout', function (timeout) {
    console.info('connect_timeout');
});
socket.on('reconnect_error', function (error) {
    console.info('reconnect_error');
});
socket.on('connect_error', function (error) {
    console.info('connect_error');
});
socket.on('error', function (error) {
    console.info('error');
});
socket.on('reconnect_failed', function () {
    console.info('reconnect_failed');
});
socket.on('disconnect', function (reason) {
    console.info('disconnect');
});


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
    $.each(msg, function (key, value) {
        if ('text' in value) {
            updateText(key, value['text']);
        }
        if ('bg' in value) {
            updateBG(key, value['bg']);
        }
        if ('display' in value) {
            if (value['display'] === 'show') {
                show(key)
            } else {
                hide(key)
            }
        }
    });
}

function updateText(item, value) {
    var updateItem = $("#" + item + "-text");

    if ($.trim(updateItem.html()) !== $.trim(value)) {
        updateItem.addClass("fade-out");

        setTimeout(function () {
            updateItem.removeClass("fade-out");

            updateItem.html(value);

            updateItem.addClass("fade-in");

            setTimeout(function () {
                updateItem.removeClass("fade-in");
            }, 1000);
        }, 1000);
    }
}

function updateBG(item, value) {
    var updateItem = $("#" + item + "-bg");

    if (!updateItem.hasClass(value)) {
        $.each(updateItem.attr('class').split(' '), function (index, value) {
            if (value.match(/.*-bg$/g) != null) {
                updateItem.removeClass(value);
            }
        });

        updateItem.addClass(value);
    }
}

function hide(item) {
    var updateItem = $("#" + item);

    if (!updateItem.hasClass('hide')) {
        updateItem.addClass("fade-out");

        setTimeout(function () {
            updateItem.removeClass("show");
            updateItem.addClass("hide");
            updateItem.removeClass("fade-out");
        }, 1000);
    }
}

function show(item) {
    var updateItem = $("#" + item);

    if (!updateItem.hasClass('show')) {
        updateItem.addClass("fade-in");

        setTimeout(function () {
            updateItem.removeClass("hide");
            updateItem.addClass("show");
            updateItem.removeClass("fade-in");
        }, 1000);
    }
}
