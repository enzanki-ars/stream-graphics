var socket = io.connect('/websocket');
socket.on('response', function (msg) {
    console.info(msg);
});

function update(item) {
    if (document.getElementById(item + '-text-form') != null) {
        socket.emit('set text', {
            'item': item,
            'value': document.getElementById(item + '-text-form').value
        });
    }
    if (document.getElementById(item + '-bg-form') != null) {
        socket.emit('set bg', {
            'item': item,
            'value': document.getElementById(item + '-bg-form').value
        });
    }
    if (document.getElementById(item + '-display-form') != null) {
        if (document.getElementById(item + '-display-form').checked) {
            socket.emit('show', {
                'item': item
            });
        } else {
            socket.emit('hide', {
                'item': item
            });
        }
    }
}
