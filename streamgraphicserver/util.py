import os
from pathlib import Path

curr_overlay_extra = {}


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


def merge_dicts(*dict_args):
    """
    Given any number of dicts, shallow copy and merge into a new dict,
    precedence goes to key value pairs in latter dicts.

    From: http://stackoverflow.com/a/26853961

    :param dict_args: Any number of dicts to add together
    :return: A merged dict
    """
    result = {}
    for dictionary in dict_args:
        result.update(dictionary)
    return result


def get_overlay_defaults():
    import json

    with open(os.path.join(get_assets_path(), 'overlay-defaults.json')) as overlay:
        defaults = json.load(overlay)

    return defaults


def load_overlay_save():
    global curr_overlay_extra

    import json

    if os.path.exists('overlay-save.json'):
        with open('overlay-save.json') as overlay:
            curr_overlay_extra = json.load(overlay)

    return curr_overlay_extra


def save_overlay():
    global curr_overlay_extra

    import json

    Path('overlay-save.json').touch()
    with open('overlay-save.json', 'w') as overlay:
        json.dump(curr_overlay_extra, fp=overlay)

    return curr_overlay_extra


def get_overlay():
    return merge_dicts(get_overlay_defaults(), load_overlay_save())
