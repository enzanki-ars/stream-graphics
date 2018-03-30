import bottle
from bottle import *
from sassutils.wsgi import SassMiddleware


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
def index():
    return static_file('overlay.html', root=get_assets_path(), mimetype='text/html')


@bottle.route('/assets/<filename>')
def assets(filename):
    return static_file(filename, root=get_assets_path())


app = SassMiddleware(bottle.app(), {
    'streamgraphicserver': ('assets/css')
})

run(host='localhost', port=8080, app=app)
