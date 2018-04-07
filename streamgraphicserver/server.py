from gevent import monkey

from streamgraphicserver.util import get_assets_path, get_overlay_defaults, merge_dicts

monkey.patch_all()

import logging

import bottle
import socketio
from bottle import *

from gevent import pywsgi
from geventwebsocket.handler import WebSocketHandler

logger = logging.getLogger(__name__)
logging.basicConfig()
logger.setLevel(logging.INFO)

sio = socketio.Server(async_mode='gevent')
socket_app = socketio.Middleware(sio, bottle.app())

bottle.TEMPLATE_PATH.insert(0, get_assets_path())

curr_overlay_info = {}

colors = ['black-bg',
          'red-bg',
          'green-bg',
          'blue-bg',
          'dark-red-bg',
          'dark-green-bg',
          'dark-blue-bg',
          'cyan-bg',
          'magenta-bg',
          'yellow-bg',
          'pink-bg',
          'orange-bg',
          'yellow-green-bg',
          'blue-green-bg',
          'light-blue-bg',
          'violet-bg',
          'grey-bg',
          'white-bg']


@bottle.route('/')
def serve_overlay():
    return template('index')


@bottle.route('/admin')
def serve_overlay():
    return template('admin', overlay=merge_dicts(get_overlay_defaults(), curr_overlay_info), colors=colors)


@bottle.route('/overlay')
def serve_overlay():
    return template('overlay', overlay=merge_dicts(get_overlay_defaults(), curr_overlay_info))


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
    sio.emit('online', merge_dicts(get_overlay_defaults(), curr_overlay_info), namespace='/websocket')


@sio.on('set text', namespace='/websocket')
def sio_graphics_event(sid, data):
    logger.info('text update event: ' + str(data))
    curr_overlay_info[data['item']] = {'text': data['value']}
    sio.emit('change text', data, namespace='/websocket')


@sio.on('set bg', namespace='/websocket')
def sio_bg_event(sid, data):
    logger.info('bg update event: ' + str(data))
    curr_overlay_info[data['item']] = {'bg': data['value']}
    sio.emit('change bg', data, namespace='/websocket')


@sio.on('show', namespace='/websocket')
def sio_show_event(sid, data):
    logger.info('show event: ' + str(data))
    curr_overlay_info[data['item']] = {'display': 'show'}
    sio.emit('change show', data, namespace='/websocket')


@sio.on('hide', namespace='/websocket')
def sio_hid_event(sid, data):
    logger.info('hide event: ' + str(data))
    curr_overlay_info[data['item']] = {'display': 'hide'}
    sio.emit('change hide', data, namespace='/websocket')


@sio.on('disconnect', namespace='/websocket')
def sio_disconnect(sid):
    logger.info('disconnect: ' + sid)


if __name__ == '__main__':
    import sass

    sass.compile(dirname=(os.path.join(get_assets_path(), 'css'), os.path.join(get_assets_path(), 'css')),
                 output_style='compressed')

    logger.info('Starting server at 0.0.0.0 on port 8080.')
    pywsgi.WSGIServer(('', 8080), socket_app, handler_class=WebSocketHandler).serve_forever()
