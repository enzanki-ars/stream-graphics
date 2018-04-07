import glob
import os

from distutils.core import setup

setup(
    name='stream-graphics',
    version='1.0.0',
    url='https://enzanki-ars.github.io/live-tv',
    license='GNU AGPLv3',
    author='Alex Shafer',
    author_email='enzanki.ars@gmail.com',
    description='Server for enzanki_ars\'s stream graphics',
    setup_requires=['libsass'],
    requires=['bottle >= 0.12, < 0.13',
              'libsass >= 0.14, < 0.15',
              'tornado >= 4.5, < 4.6',
              'gevent >= 1.3a2, < 1.4',
              'gevent-websocket >= 0.10, < 0.11',
              'python-socketio >= 1.9, < 1.10'],
    packages=['streamgraphicserver'],
    package_dir={
        'streamgraphicserver': 'streamgraphicserver'
    },
    package_data={
        'streamgraphicserver':
            [glob.glob(os.path.join('assets', '*')),
             glob.glob(os.path.join('assets', '**', '*'))]
    },
    sass_manifests={
        'streamgraphicserver': ('assets/css')
    }
)
