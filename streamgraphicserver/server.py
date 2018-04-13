from gevent import monkey

from streamgraphicserver.util import get_assets_path, get_overlay_defaults, get_user_overlays, get_overlay, \
    get_all_overlays, update_overlay, copy_default

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

colors = ['black-bg',
          'red-bg',
          'green-bg',
          'blue-bg',
          'cyan-bg',
          'magenta-bg',
          'yellow-bg',
          'pink-bg',
          'orange-bg',
          'yellow-green-bg',
          'blue-green-bg',
          'light-blue-bg',
          'violet-bg',
          'dark-grey-bg',
          'grey-bg',
          'light-grey-bg',
          'white-bg']


@bottle.route('/')
def serve_index():
    return template('index', default_overlays=get_overlay_defaults(), user_overlays=get_user_overlays())


@bottle.route('/copy-default-overlay')
def copy_default_overlay():
    base_name = request.forms.get('base_name') or request.query.base_name
    new_name = request.forms.get('new_name') or request.query.new_name

    copy_default(base_name, new_name)

    redirect("/overlay/" + new_name)


@bottle.route('/copy-default-admin')
def copy_default_overlay():
    base_name = request.forms.get('base_name') or request.query.base_name
    new_name = request.forms.get('new_name') or request.query.new_name

    copy_default(base_name, new_name)

    redirect("/admin/" + new_name)


@bottle.route('/admin/<overlay>')
def serve_admin(overlay):
    return template('admin', default_overlays=get_overlay_defaults(), user_overlays=get_user_overlays(),
                    overlay_info=get_overlay(overlay), overlay_name=overlay, colors=colors)


@bottle.route('/overlay/<overlay>')
def serve_overlay(overlay):
    return template('overlay', overlay=get_overlay(overlay), overlay_name=overlay)


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
    sio.emit('online', get_all_overlays(), namespace='/websocket')


@sio.on('set text', namespace='/websocket')
def sio_graphics_event(sid, data):
    logger.info('text update event: ' + str(data))

    update_overlay(data['overlay'], data['item'], 'text', data['value'])

    sio.emit('change text', data, namespace='/websocket')


@sio.on('set bg', namespace='/websocket')
def sio_bg_event(sid, data):
    logger.info('bg update event: ' + str(data))

    update_overlay(data['overlay'], data['item'], 'bg', data['value'])

    sio.emit('change bg', data, namespace='/websocket')


@sio.on('show', namespace='/websocket')
def sio_show_event(sid, data):
    logger.info('show event: ' + str(data))

    update_overlay(data['overlay'], data['item'], 'display', 'show')

    sio.emit('change show', data, namespace='/websocket')


@sio.on('hide', namespace='/websocket')
def sio_hid_event(sid, data):
    logger.info('hide event: ' + str(data))

    update_overlay(data['overlay'], data['item'], 'display', 'hide')

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
