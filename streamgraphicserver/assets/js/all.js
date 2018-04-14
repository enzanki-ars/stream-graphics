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
    console.info('update text ' + msg['overlay'] + ' ' + msg['item'] + ' ' + msg['value']);

    updateText(msg['overlay'], msg['item'], msg['value']);
});
socket.on('change bg', function (msg) {
    console.info('update bg ' + msg['overlay'] + ' ' + msg['item'] + ' ' + msg['value']);

    updateBG(msg['overlay'], msg['item'], msg['value']);
});
socket.on('change hide', function (msg) {
    console.info('hide ' + msg['overlay'] + ' ' + msg['item']);

    hide(msg['overlay'], msg['item']);
});
socket.on('change show', function (msg) {
    console.info('show ' + msg['overlay'] + ' ' + msg['item']);
    show(msg['overlay'], msg['item']);
});

function updateAll(msg) {
    $.each(msg, function (overlay, overlay_info) {
        $.each(overlay_info, function (item, value) {
            if ('text' in value) {
                updateText(overlay, item, value['text']);
            }
            if ('bg' in value) {
                updateBG(overlay, item, value['bg']);
            }
            if ('display' in value) {
                if (value['display'] === 'show') {
                    show(overlay, item)
                } else {
                    hide(overlay, item)
                }
            }
        });
    });
}
