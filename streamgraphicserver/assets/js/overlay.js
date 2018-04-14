

function updateText(overlay, item, value) {
    var updateItem = $("#" + overlay + '-' + item);

    if ($.trim(updateItem.text()) !== $.trim(value)) {
        updateItem.addClass("fade-out");

        setTimeout(function () {
            updateItem.removeClass("fade-out");

            updateItem.text(value);

            updateItem.addClass("fade-in");

            setTimeout(function () {
                updateItem.removeClass("fade-in");
            }, 1000);
        }, 1000);
    }
}

function updateBG(overlay, item, value) {
    var updateItem = $("#" + overlay + '-' + item);
    var oldValue;

    if (!updateItem.hasClass(value)) {
        $.each(updateItem.attr('class').split(' '), function (index, currClass) {
            if (currClass.match(/.*-bg$/g) != null) {
                oldValue = currClass;
            }
        });

        updateItem.removeClass(oldValue);
        updateItem.addClass(oldValue + '-to-' + value);
        setTimeout(function () {
            updateItem.removeClass(oldValue + '-to-' + value);
            updateItem.addClass(value);
        }, 1000);

    }
}

function hide(overlay, item) {
    var updateItem = $("#" + overlay + '-' + item);

    if (!updateItem.hasClass('hide')) {
        updateItem.addClass("fade-out");

        setTimeout(function () {
            updateItem.removeClass("show");
            updateItem.addClass("hide");
            updateItem.removeClass("fade-out");
        }, 1000);
    }
}

function show(overlay, item) {
    var updateItem = $("#" + overlay + '-' + item);

    if (!updateItem.hasClass('show')) {
        updateItem.addClass("fade-in");

        setTimeout(function () {
            updateItem.removeClass("hide");
            updateItem.addClass("show");
            updateItem.removeClass("fade-in");
        }, 1000);
    }
}
