from gevent import monkey

monkey.patch_all()

import logging

import bottle
from bottle import *
from sassutils.wsgi import SassMiddleware

logging.basicConfig()

app = SassMiddleware(bottle.app(), {
    'streamgraphicserver': ('assets/css')
})


def get_assets_path():
    import os
    import sys

    import streamgraphicserver.assets

    if getattr(sys, 'frozen', False):
        assets_path = os.path.join(sys._MEIPASS, 'assets')
    else:
        assets_path = os.path.join(
            streamgraphicserver.assets.__path__[0])
    return assets_path


@bottle.route('/')
@bottle.route('/overlay')
def overlay():
    return static_file('overlay.html', root=get_assets_path(), mimetype='text/html')


@bottle.route('/background')
def background():
    return static_file('background.html', root=get_assets_path(), mimetype='text/html')


@bottle.route('/assets/css/<filename>')
def assets_css(filename):
    return static_file(filename, root=os.path.join(get_assets_path(), 'css'))


@bottle.route('/assets/js/<filename>')
def assets_js(filename):
    return static_file(filename, root=os.path.join(get_assets_path(), 'js'))


@bottle.route('/websocket')
def handle_websocket():
    from geventwebsocket import WebSocketError

    wsock = request.environ.get('wsgi.websocket')
    if not wsock:
        abort(400, 'Expected WebSocket request.')
    while True:
        try:
            message = wsock.receive()
            logging.debug('WS Receive:', message)

        except WebSocketError:
            break


if __name__ == '__main__':
    from geventwebsocket.handler import WebSocketHandler

    bottle.run(host='localhost', port=8080, app=app, server='gevent', handler_class=WebSocketHandler)
