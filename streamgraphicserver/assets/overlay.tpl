<!DOCTYPE html>
<html>
<head>
    <title>enzanki_ars's Stream Graphics (v4) - {{ overlay_name }}</title>

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

    <link rel="stylesheet" type="text/css" href="/assets/css/all.css">

    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>

    <script defer src="https://use.fontawesome.com/releases/v5.0.10/js/all.js"
            integrity="sha384-slN8GvtUJGnv6ca26v8EzVaR9DC58QEwsIk9q1QXdCU8Yu8ck/tL/5szYlBbqmS+"
            crossorigin="anonymous"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.0/socket.io.js"
            integrity="sha256-Thm9kMI2BQKxVnCWipQIGeb8QVl2lohO+WWWfCiF8b0=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.0/moment.min.js"
            integrity="sha256-DELCOgoVsZqjT78lDC7zcX+YFp+PEjh1k23mBMoDBwo=" crossorigin="anonymous"></script>
    <script src="/assets/js/all.js"></script>
    <script src="/assets/js/overlay.js"></script>
</head>
<body>
% for item in overlay:

<%
    classes = ""
    if 'bg' in overlay[item]:
        classes += overlay[item]['bg'] + ' '
    if 'display' in overlay[item]:
        classes += overlay[item]['display'] + ' '
    if 'text-color' in overlay[item]:
        classes += overlay[item]['text-color'] + '-text '
    if 'text-style' in overlay[item]:
        classes += 'text-' + overlay[item]['text-style'] + ' '
    if 'x' in overlay[item]:
        classes += 'x-' + str(overlay[item]['x']) + ' '
    if 'y' in overlay[item]:
        classes += 'y-' + str(overlay[item]['y']) + ' '
    if 'w' in overlay[item]:
        classes += 'w-' + str(overlay[item]['w']) + ' '
    if 'h' in overlay[item]:
        classes += 'h-' + str(overlay[item]['h']) + ' '
%>
<div id="{{overlay_name}}-{{ item }}" class="{{classes}}">
    % if 'text' in overlay[item]:
    {{ overlay[item]['text'] }}
    % end
</div>
% end

</body>
</html>
