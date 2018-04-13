function update(overlay, item) {
    var updateItemText = $('#' + overlay + '-' + item + '-text-form');
    var updateItemBG = $('#' + overlay + '-' + item + '-bg-form');
    var updateItemDisplay = $('#' + overlay + '-' + item + '-display-form');

    if (updateItemText.length) {
        socket.emit('set text', {
            'overlay': overlay,
            'item': item,
            'value': updateItemText.val()
        });
    }
    if (updateItemBG.length) {
        socket.emit('set bg', {
            'overlay': overlay,
            'item': item,
            'value': updateItemBG.val()
        });
    }
    if (updateItemDisplay.length) {
        if (updateItemDisplay.prop("checked")) {
            socket.emit('show', {
                'overlay': overlay,
                'item': item
            });
        } else {
            socket.emit('hide', {
                'overlay': overlay,
                'item': item
            });
        }
    }
}

function submitAll() {
    $("#form button, input[type='button']").click()
}

function updateText(overlay, item, value) {
    var updateItem = $('#' + overlay + '-' + item + '-text-form');

    updateItem.val(value);
}

function updateBG(overlay, item, value) {
    var updateItem = $('#' + overlay + '-' + item + '-bg-form');

    updateItem.val(value);
}

function hide(overlay, item) {
    var updateItem = $('#' + overlay + '-' + item + '-display-form');

    updateItem.prop("checked", false);
}

function show(overlay, item) {
    var updateItem = $('#' + overlay + '-' + item + '-display-form');

    updateItem.prop("checked", true);
}

