var socket = io.connect('/websocket');
socket.on('response', function (msg) {
    console.info(msg);
});
