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
            height: 1920px;
        }
    </style>

    <link rel="stylesheet" type="text/css" href="assets/css/all.scss.css">

    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.0/socket.io.js"
            integrity="sha256-Thm9kMI2BQKxVnCWipQIGeb8QVl2lohO+WWWfCiF8b0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment.min.js"
            integrity="sha256-DELCOgoVsZqjT78lDC7zcX+YFp+PEjh1k23mBMoDBwo=" crossorigin="anonymous"></script>
    <script src="assets/js/websocket.js"></script>
    <script src="assets/js/util.js"></script>
</head>
<body>
<svg width="1920px" height="1080px">
    <g id="overlay">
        <g id="top">
            <g id="top-title" transform="translate(48,24)">
                <rect id="top-title-bg" class="green-bg" width="192" height="48"></rect>
                <text id="top-title-text" x="96" y="24" class="white-text text-bold text-center">
                    {{ overlay_text['top-title-text'] }}
                </text>
            </g>
            <g id="top-info" transform="translate(256,24)">
                <rect id="top-info-bg" class="black-bg" width="384" height="48"></rect>
                <text id="top-info-text" x="192" y="24" class="white-text text-center">
                    {{ overlay_text['top-info-text'] }}
                </text>
            </g>

            <g id="source" transform="translate(1280,24)">
                <rect id="source-bg" class="black-bg" width="384" height="48"></rect>
                <text id="source-text" x="192" y="24" class="white-text text-center">
                    {{ overlay_text['source-text'] }}
                </text>
            </g>

            <g id="status" transform="translate(1680,24)">
                <rect id="status-bg" class="red-bg" width="192" height="48"></rect>
                <text id="status-text" x="96" y="24" class="white-text text-bold text-center">
                    {{ overlay_text['status-text'] }}
                </text>
            </g>
        </g>

        <g id="scoreboard" transform="translate(48,88)">
            <g id="team1">
                <g id="team1-name">
                    <rect id="team1-bg" class="blue-bg" width="320" height="48"></rect>
                    <text id="team1-text" x="16" y="24" class="white-text text-bold">
                        {{ overlay_text['team1-text'] }}
                    </text>
                </g>

                <g id="team1-score" transform="translate(320,0)">
                    <rect id="team1-score-bg" class="black-bg" width="64" height="48"></rect>
                    <text id="team1-score-text" x="32" y="24" class="white-text text-bold text-center">
                        {{ overlay_text['team1-score-text'] }}
                    </text>
                </g>
            </g>

            <g id="team2" transform="translate(0,48)">
                <g id="team2-name">
                    <rect id="team2-bg" class="red-bg" width="320" height="48"></rect>
                    <text id="team2-text" x="16" y="24" class="white-text text-bold">
                        {{ overlay_text['team2-text'] }}
                    </text>
                </g>

                <g id="team2-score" transform="translate(320,0)">
                    <rect id="team2-score-bg" class="black-bg" width="64" height="48"></rect>
                    <text id="team2-score-text" x="32" y="24" class="white-text text-bold text-center">
                        {{ overlay_text['team2-score-text'] }}
                    </text>
                </g>
            </g>
        </g>

        <g id="info">
            <g id="left-info" transform="translate(48,896)">
                <rect id="left-info-bg" class="grey-bg" width="362" height="96"></rect>
                <text id="left-info-text-top" x="16" y="24" class="white-text text-bold">
                    {{ overlay_text['left-info-text-top'] }}
                </text>
                <text id="left-info-text-bottom" x="16" y="72" class="white-text">
                    {{ overlay_text['left-info-text-bottom'] }}
                </text>
            </g>

            <g id="center-info" transform="translate(426,896)">
                <rect id="center-info-bg" class="grey-bg" width="1068" height="96"></rect>
                <text id="center-info-text-top" x="534" y="24" class="white-text text-bold text-center">
                    {{ overlay_text['center-info-text-top'] }}
                </text>
                <text id="center-info-text-bottom" x="534" y="72" class="white-text text-center">
                    {{ overlay_text['center-info-text-bottom'] }}
                </text>
            </g>

            <g id="right-info" transform="translate(1510,896)">
                <rect id="right-info-bg" class="grey-bg" width="362" height="96"></rect>
                <text id="right-info-text-top" x="346" y="24" class="white-text text-bold text-right">
                    {{ overlay_text['right-info-text-top'] }}
                </text>
                <text id="right-info-text-bottom" x="346" y="72" class="white-text text-right">
                    {{ overlay_text['right-info-text-bottom'] }}
                </text>
            </g>
        </g>

        <g id="bottom">
            <g id="name" transform="translate(48,1008)">
                <rect id="name-bg" class="black-bg" width="192" height="48"></rect>
                <text id="name-text" x="96" y="24" class="white-text text-bold text-center">
                    {{ overlay_text['name-text'] }}
                </text>
            </g>

            <g id="bottom-bar" transform="translate(256,1008)">
                <rect id="bottom-bar-bg" class="black-bg" width="1408" height="48"></rect>
                <text id="bottom-bar-text" x="699.5" y="24" class="white-text text-bold text-center">
                    {{ overlay_text['bottom-bar-text'] }}
                </text>
            </g>

            <g id="time" transform="translate(1680,1008)">
                <rect id="time-bg" class="black-bg" width="192" height="48"></rect>
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
