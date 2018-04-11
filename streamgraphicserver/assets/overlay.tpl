<!DOCTYPE html>
<html>
<head>
    <title>enzanki_ars's Stream Graphics (v4)</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <style>
        html, body {
            margin: 0;
            padding: 0;
            width: 100%;
            height: 100%;
            overflow: hidden;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="assets/css/all.css">

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

    <script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js"
            integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+"
            crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.0/socket.io.js"
            integrity="sha256-Thm9kMI2BQKxVnCWipQIGeb8QVl2lohO+WWWfCiF8b0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment.min.js"
            integrity="sha256-DELCOgoVsZqjT78lDC7zcX+YFp+PEjh1k23mBMoDBwo=" crossorigin="anonymous"></script>
    <script src="assets/js/websocket.js"></script>
    <script src="assets/js/util.js"></script>
</head>
<body>
<div id="overlay" class="{{ overlay['overlay']['display'] }}">
    <div id="top" class="{{ overlay['top']['display'] }}">
        <div id="top-title"
             class="{{ overlay['top-title']['display'] }} {{ overlay['top-title']['bg'] }} pos-x-1-y-1 white-text text-bold w-3-h-1">
            {{ overlay['top-title']['text'] }}
        </div>
        <div id="top-info"
             class="{{ overlay['source']['display'] }} {{ overlay['top-info']['bg'] }} pos-x-4-y-1 white-text w-4-h-1">
            {{ overlay['top-info']['text'] }}
        </div>

        <div id="source"
             class="{{ overlay['source']['display'] }} {{ overlay['source']['bg'] }} pos-x-16-y-1 white-text w-4-h-1">
            {{ overlay['source']['text'] }}
        </div>

        <div id="status"
             class="{{ overlay['status']['display'] }} {{ overlay['status']['bg'] }} pos-x-20-y-1 white-text text-bold w-3-h-1">
            {{ overlay['status']['text'] }}
        </div>
    </div>

    <div id="scoreboard" class="{{ overlay['scoreboard']['display'] }}">
        <div id="team1" class="{{ overlay['team1']['display'] }}">
            <div id="team1-name"
                 class="{{ overlay['team1-name']['display'] }} {{ overlay['team1-name']['bg'] }} pos-x-1-y-2 white-text text-bold w-4-h-1">
                {{ overlay['team1-name']['text'] }}
            </div>

            <div id="team1-score"
                 class="{{ overlay['team1-score']['display'] }} {{ overlay['team1-score']['bg'] }} pos-x-5-y-2 white-text text-bold w-1-h-1">
                {{ overlay['team1-score']['text'] }}
            </div>
        </div>

        <div id="team2" class="{{ overlay['team2']['display'] }}">
            <div id="team2-name"
                 class="{{ overlay['team2-name']['display'] }} {{ overlay['team2-name']['bg'] }} pos-x-1-y-3 white-text text-bold w-4-h-1">
                {{ overlay['team2-name']['text'] }}
            </div>

            <div id="team2-score"
                 class="{{ overlay['team2-score']['display'] }} {{ overlay['team2-score']['bg'] }} pos-x-5-y-3 white-text text-bold w-1-h-1">
                {{ overlay['team2-score']['text'] }}
            </div>
        </div>
    </div>

    <div id="info" class="{{ overlay['info']['display'] }}">
        <div id="left-info" class="{{ overlay['left-info']['display'] }}">
            <div id="left-info-top"
                 class="{{ overlay['left-info-top']['display'] }} {{ overlay['left-info-top']['bg'] }} pos-x-1-y-20 white-text text-bold w-6-h-1">
                {{ overlay['left-info-top']['text'] }}
            </div>
            <div id="left-info-bottom"
                 class="{{ overlay['left-info-bottom']['display'] }} {{ overlay['left-info-bottom']['bg'] }} pos-x-1-y-21 white-text w-6-h-1">
                {{ overlay['left-info-bottom']['text'] }}
            </div>
        </div>

        <div id="center-info" class="{{ overlay['center-info']['display'] }}">
            <div id="center-info-top"
                 class="{{ overlay['center-info-top']['display'] }} {{ overlay['center-info-top']['bg'] }} pos-x-7-y-20 white-text text-bold w-10-h-1">
                {{ overlay['center-info-top']['text'] }}
            </div>
            <div id="center-info-bottom"
                 class="{{ overlay['center-info-bottom']['display'] }} {{ overlay['center-info-bottom']['bg'] }} pos-x-7-y-21 white-text w-10-h-1">
                {{ overlay['center-info-bottom']['text'] }}
            </div>
        </div>

        <div id="right-info" class="{{ overlay['right-info']['display'] }}">
            <div id="right-info-top"
                 class="{{ overlay['right-info-top']['display'] }} {{ overlay['right-info-top']['bg'] }} pos-x-17-y-20 white-text text-bold w-6-h-1">
                {{ overlay['right-info-top']['text'] }}
            </div>
            <div id="right-info-bottom"
                 class="{{ overlay['right-info-bottom']['display'] }} {{ overlay['right-info-bottom']['bg'] }} pos-x-17-y-21 white-text w-6-h-1">
                {{ overlay['right-info-bottom']['text'] }}
            </div>
        </div>
    </div>

    <div id="bottom" class="{{ overlay['bottom']['display'] }}">
        <div id="name"
             class="{{ overlay['name']['display'] }} {{ overlay['name']['bg'] }} pos-x-1-y-22 white-text text-bold w-3-h-1">
            {{ overlay['name']['text'] }}
        </div>
        <div id="bottom-bar"
             class="{{ overlay['bottom-bar']['display'] }} {{ overlay['bottom-bar']['bg'] }} pos-x-4-y-22 white-text w-16-h-1">
            {{ overlay['bottom-bar']['text'] }}
        </div>

        <div id="time"
             class="{{ overlay['time']['display'] }} {{ overlay['time']['bg'] }} pos-x-20-y-22 white-text text-bold w-3-h-1">
            % from time import strftime
            {{ strftime('%I:%M:%S %p') }}
        </div>
    </div>
</div>

</body>
</html>
