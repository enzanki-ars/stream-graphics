import logging

import bottle
from bottle import *
from sassutils.wsgi import SassMiddleware

logging.basicConfig()


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


@bottle.route('/assets/<filename>')
def assets(filename):
    return static_file(filename, root=get_assets_path())


app = SassMiddleware(bottle.app(), {
    'streamgraphicserver': ('assets/css')
})

if __name__ == '__main__':
    bottle.run(host='localhost', port=8080, app=app, server='tornado')
