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

function update(item) {
    var updateItemText = $('#' + item + '-text-form');
    var updateItemBG = $('#' + item + '-bg-form');
    var updateItemDisplay = $('#' + item + '-display-form');

    if (updateItemText.length) {
        socket.emit('set text', {
            'item': item,
            'value': updateItemText.val()
        });
    }
    if (updateItemBG.length) {
        socket.emit('set bg', {
            'item': item,
            'value': updateItemBG.val()
        });
    }
    if (updateItemDisplay.length) {
        if (updateItemDisplay.prop("checked")) {
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
    var updateItem = $('#' + item + '-text-form');

    updateItem.val(value);
}

function updateBG(item, value) {
    var updateItem = $('#' + item + '-bg-form');

    updateItem.val(value);
}

function hide(item) {
    var updateItem = $('#' + item + '-display-form');

    updateItem.prop("checked", false);
}

function show(item) {
    var updateItem = $('#' + item + '-display-form');

    updateItem.prop("checked", true);
}

