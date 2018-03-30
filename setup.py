import glob
import os

from distutils.core import setup

setup(
    name='stream-graphics',
    version='1.0.0-dev1',
    url='https://enzanki-ars.github.io/live-tv',
    license='GNU AGPLv3',
    author='Alex Shafer',
    author_email='enzanki.ars@gmail.com',
    description='Server for enzanki_ars\'s stream graphics',
    setup_requires=['libsass'],
    requires=['bottle',
              'libsass',
              'tornado'],
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
