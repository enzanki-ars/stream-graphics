import os
from shutil import copyfile

import ruamel.yaml

current_overlays = {}


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


def get_overlay_defaults():
    default_overlay_list = []

    for name in os.listdir(os.path.join(get_assets_path(), 'overlay-defaults')):
        default_overlay_list.append(os.path.splitext(name)[0])

    return default_overlay_list


def get_user_overlays():
    overlay_list = []

    if os.path.isdir('overlays'):
        for name in os.listdir('overlays'):
            overlay_list.append(os.path.splitext(name)[0])

    return overlay_list


def get_overlay(filename):
    if filename not in current_overlays:
        with open(os.path.join('overlays', filename) + '.yaml') as overlay_file:
            current_overlays[filename] = ruamel.yaml.safe_load(overlay_file)

    return current_overlays[filename]


def update_overlay(filename, item, type, value):
    get_overlay(filename)

    current_overlays[filename][item][type] = value

    with open(os.path.join('overlays', filename) + '.yaml', 'w') as overlay_file:
        ruamel.yaml.dump(current_overlays[filename], overlay_file, Dumper=ruamel.yaml.RoundTripDumper)


def copy_default(default_name, to_name):
    if to_name not in get_user_overlays():
        if not os.path.exists('overlays'):
            os.makedirs('overlays')

        copyfile(os.path.join(get_assets_path(), 'overlay-defaults', default_name) + '.yaml',
                 os.path.join('overlays', to_name) + '.yaml')


def get_all_overlays():
    all_overlays = {}

    for overlay in get_user_overlays():
        with open(os.path.join('overlays', overlay) + '.yaml') as overlay_file:
            all_overlays[overlay] = ruamel.yaml.safe_load(overlay_file)
