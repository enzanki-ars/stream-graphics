from gevent import monkey

monkey.patch_all()

import logging

import bottle
import socketio
from bottle import *

from gevent import pywsgi
from geventwebsocket.handler import WebSocketHandler
from sassutils.wsgi import SassMiddleware

logger = logging.getLogger(__name__)
logging.basicConfig()
logger.setLevel(logging.INFO)

sio = socketio.Server(async_mode='gevent')
socket_app = socketio.Middleware(sio, bottle.app())
sass_app = SassMiddleware(socket_app, {
    'streamgraphicserver': ('assets/css')
})

overlay_text = {
    'top-title-text': 'Testing',
    'top-info-text': 'Testing Graphics',
    'source-text': 'Testing Graphics',
    'status-text': 'LIVE',
    'team1-text': 'Team 1',
    'team1-score-text': '0',
    'team2-text': 'Team 2',
    'team2-score-text': '0',
    'left-info-text-top': 'Left Side',
    'left-info-text-bottom': 'Testing left side',
    'center-info-text-top': 'Center',
    'center-info-text-bottom': 'This text is in the center',
    'right-info-text-top': 'Right Side',
    'right-info-text-bottom': 'Testing right side',
    'name-text': 'enzankiars',
    'bottom-bar-text': 'This will not scroll, but instead fade in and out on changes...'
}


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


bottle.TEMPLATE_PATH.insert(0, get_assets_path())


@bottle.route('/')
@bottle.route('/overlay')
def serve_overlay():
    return template('overlay', overlay_text=overlay_text)


@bottle.route('/background')
def serve_background():
    return template('background')


@bottle.route('/assets/css/<filename>')
def serve_assets_css(filename):
    return static_file(filename, root=os.path.join(get_assets_path(), 'css'))


@bottle.route('/assets/js/<filename>')
def serve_assets_js(filename):
    return static_file(filename, root=os.path.join(get_assets_path(), 'js'))


@sio.on('connect', namespace='/websocket')
def sio_connect(sid, environ):
    logger.info('connect: ' + sid)
    sio.emit('response', sid + ' joined.', namespace='/websocket')


@sio.on('set graphics', namespace='/websocket')
def sio_graphics_event(sid, data):
    logger.info('graphics event: ' + data)
    sio.emit('change graphics', data, namespace='/websocket')


@sio.on('disconnect', namespace='/websocket')
def sio_disconnect(sid):
    logger.info('disconnect: ' + sid)


if __name__ == '__main__':
    # bottle.run(host='localhost', port=8080, app=sass_app, server='gevent')

    logger.info('Starting server at 0.0.0.0 on port 8080.')
    pywsgi.WSGIServer(('', 8080), sass_app, handler_class=WebSocketHandler).serve_forever()
