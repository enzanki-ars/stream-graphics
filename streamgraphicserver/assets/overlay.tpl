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
            width: 1920px;
            height: 1080px;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="assets/css/all.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.0/socket.io.js"
            integrity="sha256-Thm9kMI2BQKxVnCWipQIGeb8QVl2lohO+WWWfCiF8b0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment.min.js"
            integrity="sha256-DELCOgoVsZqjT78lDC7zcX+YFp+PEjh1k23mBMoDBwo=" crossorigin="anonymous"></script>
    <script src="assets/js/websocket.js"></script>
    <script src="assets/js/util.js"></script>
</head>
<body>
<svg width="1920px" height="1080px">
    <g id="overlay" class="{{ overlay['overlay']['display'] }}">
        <g id="top" class="{{ overlay['top']['display'] }}">
            <g id="top-title" class="{{ overlay['top-title']['display'] }}" transform="translate(48,24)">
                <rect id="top-title-bg" class="{{ overlay['top-title']['bg'] }}" width="192" height="48"></rect>
                <text id="top-title-text" x="96" y="24" class="white-text text-bold text-center">
                    {{ overlay['top-title']['text'] }}
                </text>
            </g>
            <g id="top-info" class="{{ overlay['source']['display'] }}" transform="translate(256,24)">
                <rect id="top-info-bg" class="{{ overlay['top-info']['bg'] }}" width="384" height="48"></rect>
                <text id="top-info-text" x="192" y="24" class="white-text text-center">
                    {{ overlay['top-info']['text'] }}
                </text>
            </g>

            <g id="source" class="{{ overlay['source']['display'] }}" transform="translate(1280,24)">
                <rect id="source-bg" class="{{ overlay['source']['bg'] }}" width="384" height="48"></rect>
                <text id="source-text" x="192" y="24" class="white-text text-center">
                    {{ overlay['source']['text'] }}
                </text>
            </g>

            <g id="status" class="{{ overlay['status']['display'] }}" transform="translate(1680,24)">
                <rect id="status-bg" class="{{ overlay['status']['bg'] }}" width="192" height="48"></rect>
                <text id="status-text" x="96" y="24" class="white-text text-bold text-center">
                    {{ overlay['status']['text'] }}
                </text>
            </g>
        </g>

        <g id="scoreboard" class="{{ overlay['scoreboard']['display'] }}" transform="translate(48,88)">
            <g id="team1" class="{{ overlay['team1']['display'] }}">
                <g id="team1-name" class="{{ overlay['team1-name']['display'] }}">
                    <rect id="team1-name-bg" class="{{ overlay['team1-name']['bg'] }}" width="320" height="48"></rect>
                    <text id="team1-name-text" x="16" y="24" class="white-text text-bold">
                        {{ overlay['team1-name']['text'] }}
                    </text>
                </g>

                <g id="team1-score" class="{{ overlay['team1-score']['display'] }}" transform="translate(320,0)">
                    <rect id="team1-score-bg" class="{{ overlay['team1-score']['bg'] }}" width="64" height="48"></rect>
                    <text id="team1-score-text" x="32" y="24" class="white-text text-bold text-center">
                        {{ overlay['team1-score']['text'] }}
                    </text>
                </g>
            </g>

            <g id="team2" class="{{ overlay['team2']['display'] }}" transform="translate(0,48)">
                <g id="team2-name" class="{{ overlay['team2-name']['display'] }}">
                    <rect id="team2-name-bg" class="{{ overlay['team2-name']['bg'] }}" width="320" height="48"></rect>
                    <text id="team2-name-text" x="16" y="24" class="white-text text-bold">
                        {{ overlay['team2-name']['text'] }}
                    </text>
                </g>

                <g id="team2-score" class="{{ overlay['team2-score']['display'] }}" transform="translate(320,0)">
                    <rect id="team2-score-bg" class="{{ overlay['team2-score']['bg'] }}" width="64" height="48"></rect>
                    <text id="team2-score-text" x="32" y="24" class="white-text text-bold text-center">
                        {{ overlay['team2-score']['text'] }}
                    </text>
                </g>
            </g>
        </g>

        <g id="info" class="{{ overlay['info']['display'] }}">
            <g id="left-info-top" class="{{ overlay['left-info-top']['display'] }}" transform="translate(48,896)">
                <rect id="left-info-top-bg" class="{{ overlay['left-info-top']['bg'] }}" width="362" height="48"></rect>
                <text id="left-info-top-text" x="16" y="24" class="white-text text-bold">
                    {{ overlay['left-info-top']['text'] }}
                </text>
            </g>
            <g id="left-info-bottom" class="{{ overlay['left-info-bottom']['display'] }}" transform="translate(48,944)">
                <rect id="left-info-bottom-bg" class="{{ overlay['left-info-bottom']['bg'] }}"
                      width="362" height="48"></rect>
                <text id="left-info-bottom-text" x="16" y="24" class="white-text text-left">
                    {{ overlay['left-info-bottom']['text'] }}
                </text>
            </g>

            <g id="center-info-top" class="{{ overlay['center-info-top']['display'] }}" transform="translate(426,896)">
                <rect id="center-info-top-bg" class="{{ overlay['center-info-top']['bg'] }}"
                      width="1068" height="48"></rect>
                <text id="center-info-top-text" x="534" y="24" class="white-text text-bold text-center">
                    {{ overlay['center-info-top']['text'] }}
                </text>
            </g>
            <g id="center-info-bottom" class="{{ overlay['center-info-bottom']['display'] }}"
               transform="translate(426,944)">
                <rect id="center-info-bottom-bg" class="{{ overlay['center-info-bottom']['bg'] }}"
                      width="1068" height="48"></rect>
                <text id="center-info-bottom-text" x="534" y="24" class="white-text text-center">
                    {{ overlay['center-info-bottom']['text'] }}
                </text>
            </g>

            <g id="right-info-top" class="{{ overlay['right-info-top']['display'] }}" transform="translate(1510,896)">
                <rect id="right-info-top-bg" class="{{ overlay['right-info-top']['bg'] }}"
                      width="362" height="48"></rect>
                <text id="right-info-top-text" x="346" y="24" class="white-text text-bold text-right">
                    {{ overlay['right-info-top']['text'] }}
                </text>
            </g>
            <g id="right-info-bottom" class="{{ overlay['right-info-bottom']['display'] }}"
               transform="translate(1510,944)">
                <rect id="right-info-bottom-bg" class="{{ overlay['right-info-bottom']['bg'] }}"
                      width="362" height="48"></rect>
                <text id="right-info-bottom-text" x="346" y="24" class="white-text text-right">
                    {{ overlay['right-info-bottom']['text'] }}
                </text>
            </g>
        </g>

        <g id="bottom" class="{{ overlay['bottom']['display'] }}">
            <g id="name" class="{{ overlay['name']['display'] }}" transform="translate(48,1008)">
                <rect id="name-bg" class="{{ overlay['name']['bg'] }}" width="192" height="48"></rect>
                <text id="name-text" x="96" y="24" class="white-text text-bold text-center">
                    {{ overlay['name']['text'] }}
                </text>
            </g>

            <g id="bottom-bar" class="{{ overlay['bottom-bar']['display'] }}" transform="translate(256,1008)">
                <rect id="bottom-bar-bg" class="{{ overlay['bottom-bar']['bg'] }}" width="1408" height="48"></rect>
                <text id="bottom-bar-text" x="699.5" y="24" class="white-text text-center">
                    {{ overlay['bottom-bar']['text'] }}
                </text>
            </g>

            <g id="time" class="{{ overlay['time']['display'] }}" transform="translate(1680,1008)">
                <rect id="time-bg" class="{{ overlay['time']['bg'] }}" width="192" height="48"></rect>
                <text id="time-text" x="96" y="24" class="white-text text-bold text-center">
                    % from time import strftime
                    {{ strftime('%I:%M:%S %p') }}
                </text>
            </g>
        </g>
    </g>
</svg>

</body>
</html>
