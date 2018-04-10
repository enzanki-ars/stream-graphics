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

    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.0/socket.io.js"
            integrity="sha256-Thm9kMI2BQKxVnCWipQIGeb8QVl2lohO+WWWfCiF8b0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment.min.js"
            integrity="sha256-DELCOgoVsZqjT78lDC7zcX+YFp+PEjh1k23mBMoDBwo=" crossorigin="anonymous"></script>
    <script src="assets/js/websocket.js"></script>
    <script src="assets/js/util.js"></script>
</head>
<body>
<svg height="100%" width="100%">
    <g id="overlay" class="{{ overlay['overlay']['display'] }}">
        <g id="top" class="{{ overlay['top']['display'] }}">
            <g id="top-title" class="{{ overlay['top-title']['display'] }} pos-x-1-y-1">
                <rect id="top-title-bg" class="{{ overlay['top-title']['bg'] }} w-3-h-1"></rect>
                <text id="top-title-text" class="white-text text-bold text-w-3-h-1">
                    {{ overlay['top-title']['text'] }}
                </text>
            </g>
            <g id="top-info" class="{{ overlay['source']['display'] }} pos-x-4-y-1">
                <rect id="top-info-bg" class="{{ overlay['top-info']['bg'] }} w-4-h-1"></rect>
                <text id="top-info-text" class="white-text text-w-4-h-1">
                    {{ overlay['top-info']['text'] }}
                </text>
            </g>

            <g id="source" class="{{ overlay['source']['display'] }} pos-x-16-y-1">
                <rect id="source-bg" class="{{ overlay['source']['bg'] }} w-4-h-1"></rect>
                <text id="source-text" class="white-text text-w-4-h-1">
                    {{ overlay['source']['text'] }}
                </text>
            </g>

            <g id="status" class="{{ overlay['status']['display'] }} pos-x-20-y-1">
                <rect id="status-bg" class="{{ overlay['status']['bg'] }} w-3-h-1"></rect>
                <text id="status-text" class="white-text text-bold text-w-3-h-1">
                    {{ overlay['status']['text'] }}
                </text>
            </g>
        </g>

        <g id="scoreboard" class="{{ overlay['scoreboard']['display'] }}">
            <g id="team1" class="{{ overlay['team1']['display'] }}">
                <g id="team1-name" class="{{ overlay['team1-name']['display'] }} pos-x-1-y-2">
                    <rect id="team1-name-bg" class="{{ overlay['team1-name']['bg'] }} w-4-h-1"></rect>
                    <text id="team1-name-text" class="white-text text-bold text-w-4-h-1">
                        {{ overlay['team1-name']['text'] }}
                    </text>
                </g>

                <g id="team1-score" class="{{ overlay['team1-score']['display'] }} pos-x-5-y-2">
                    <rect id="team1-score-bg" class="{{ overlay['team1-score']['bg'] }} w-1-h-1"></rect>
                    <text id="team1-score-text" class="white-text text-bold text-w-1-h-1">
                        {{ overlay['team1-score']['text'] }}
                    </text>
                </g>
            </g>

            <g id="team2" class="{{ overlay['team2']['display'] }}">
                <g id="team2-name" class="{{ overlay['team2-name']['display'] }} pos-x-1-y-3">
                    <rect id="team2-name-bg" class="{{ overlay['team2-name']['bg'] }} w-4-h-1"></rect>
                    <text id="team2-name-text" class="white-text text-bold text-w-4-h-1">
                        {{ overlay['team2-name']['text'] }}
                    </text>
                </g>

                <g id="team2-score" class="{{ overlay['team2-score']['display'] }} pos-x-5-y-3">
                    <rect id="team2-score-bg" class="{{ overlay['team2-score']['bg'] }} w-1-h-1"></rect>
                    <text id="team2-score-text" class="white-text text-bold text-w-1-h-1">
                        {{ overlay['team2-score']['text'] }}
                    </text>
                </g>
            </g>
        </g>

        <g id="info" class="{{ overlay['info']['display'] }}">
            <g id="left-info" class="{{ overlay['left-info']['display'] }}">
                <g id="left-info-top" class="{{ overlay['left-info-top']['display'] }} pos-x-1-y-20">
                    <rect id="left-info-top-bg" class="{{ overlay['left-info-top']['bg'] }} w-6-h-1"></rect>
                    <text id="left-info-top-text" class="white-text text-bold text-w-6-h-1">
                        {{ overlay['left-info-top']['text'] }}
                    </text>
                </g>
                <g id="left-info-bottom" class="{{ overlay['left-info-bottom']['display'] }} pos-x-1-y-21">
                    <rect id="left-info-bottom-bg" class="{{ overlay['left-info-bottom']['bg'] }} w-6-h-1"></rect>
                    <text id="left-info-bottom-text" class="white-text text-w-6-h-1">
                        {{ overlay['left-info-bottom']['text'] }}
                    </text>
                </g>
            </g>

            <g id="center-info" class="{{ overlay['center-info']['display'] }}">
                <g id="center-info-top" class="{{ overlay['center-info-top']['display'] }} pos-x-7-y-20">
                    <rect id="center-info-top-bg" class="{{ overlay['center-info-top']['bg'] }} w-10-h-1"></rect>
                    <text id="center-info-top-text" class="white-text text-bold text-w-10-h-1">
                        {{ overlay['center-info-top']['text'] }}
                    </text>
                </g>
                <g id="center-info-bottom" class="{{ overlay['center-info-bottom']['display'] }} pos-x-7-y-21">
                    <rect id="center-info-bottom-bg" class="{{ overlay['center-info-bottom']['bg'] }} w-10-h-1"></rect>
                    <text id="center-info-bottom-text" class="white-text text-w-10-h-1">
                        {{ overlay['center-info-bottom']['text'] }}
                    </text>
                </g>
            </g>

            <g id="right-info" class="{{ overlay['right-info']['display'] }}">
                <g id="right-info-top" class="{{ overlay['right-info-top']['display'] }} pos-x-17-y-20">
                    <rect id="right-info-top-bg" class="{{ overlay['right-info-top']['bg'] }} w-6-h-1"></rect>
                    <text id="right-info-top-text" class="white-text text-bold text-w-6-h-1">
                        {{ overlay['right-info-top']['text'] }}
                    </text>
                </g>
                <g id="right-info-bottom" class="{{ overlay['right-info-bottom']['display'] }} pos-x-17-y-21">
                    <rect id="right-info-bottom-bg" class="{{ overlay['right-info-bottom']['bg'] }} w-6-h-1"></rect>
                    <text id="right-info-bottom-text" class="white-text text-w-6-h-1">
                        {{ overlay['right-info-bottom']['text'] }}
                    </text>
                </g>
            </g>
        </g>

        <g id="bottom" class="{{ overlay['bottom']['display'] }}">
            <g id="name" class="{{ overlay['name']['display'] }} pos-x-1-y-22">
                <rect id="name-bg" class="{{ overlay['name']['bg'] }} w-3-h-1"></rect>
                <text id="name-text" class="white-text text-bold text-w-3-h-1">
                    {{ overlay['name']['text'] }}
                </text>
            </g>
            <g id="bottom-bar" class="{{ overlay['bottom-bar']['display'] }} pos-x-4-y-22">
                <rect id="bottom-bar-bg" class="{{ overlay['bottom-bar']['bg'] }} w-16-h-1"></rect>
                <text id="bottom-bar-text" class="white-text  text-w-16-h-1">
                    {{ overlay['bottom-bar']['text'] }}
                </text>
            </g>

            <g id="time" class="{{ overlay['time']['display'] }} pos-x-20-y-22">
                <rect id="time-bg" class="{{ overlay['time']['bg'] }} w-3-h-1"></rect>
                <text id="time-text" class="white-text text-bold text-w-3-h-1">
                    % from time import strftime
                    {{ strftime('%I:%M:%S %p') }}
                </text>
            </g>
        </g>
    </g>
</svg>

</body>
</html>
