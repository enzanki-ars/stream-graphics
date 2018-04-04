function updateTime() {
    document.getElementById("time-text")['innerHTML'] = moment().format("hh:mm:ss A");
}
setInterval(updateTime, 1000);
