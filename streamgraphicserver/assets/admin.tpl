<!DOCTYPE html>
<html>
<head>
    <title>enzanki_ars's Stream Graphics (v4) - Admin - {{ overlay_name }}</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css"
          integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
            crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js"
            integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ"
            crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js"
            integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm"
            crossorigin="anonymous"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.0/socket.io.js"
            integrity="sha256-Thm9kMI2BQKxVnCWipQIGeb8QVl2lohO+WWWfCiF8b0=" crossorigin="anonymous"></script>
    <script src="/assets/js/all.js"></script>
    <script src="/assets/js/form.js"></script>
</head>
<body>

<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="/">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Admin
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <form class="px-4 py-3" action="/copy-default-admin">
                        <div class="form-group">
                            <label for="default-overlay-list" class="sr-only">Default Overlays</label>
                            <select class="form-control" name="base_name" id="default-overlay-list">
                                % for overlay in default_overlays:
                                <option>{{overlay}}</option>
                                % end
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownForm">New Name</label>
                            <input type="text" class="form-control" id="exampleDropdownForm" name="new_name"
                                   placeholder="New Name">
                        </div>
                        <button type="submit" class="btn btn-primary">Copy</button>
                    </form>
                    <div class="dropdown-divider"></div>
                    % for overlay in user_overlays:
                    <a class="dropdown-item" href="/admin/{{overlay}}">{{overlay}}</a>
                    % end
                </div>
            </li>
            <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown2" role="button" data-toggle="dropdown"
                   aria-haspopup="true" aria-expanded="false">
                    Overlay
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <form class="px-4 py-3" action="/copy-default-overlay">
                        <div class="form-group">
                            <label for="default-overlay-list2" class="sr-only">Default Overlays</label>
                            <select class="form-control" name="base_name" id="default-overlay-list2">
                                % for overlay in default_overlays:
                                <option>{{overlay}}</option>
                                % end
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownForm2">New Name</label>
                            <input type="text" class="form-control" id="exampleDropdownForm2" name="new_name"
                                   placeholder="New Name">
                        </div>
                        <button type="submit" class="btn btn-primary">Copy</button>
                    </form>
                    <div class="dropdown-divider"></div>
                    % for overlay in user_overlays:
                    <a class="dropdown-item" href="/overlay/{{overlay}}">{{overlay}}</a>
                    % end
                </div>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/background">Background</a>
            </li>
        </ul>
        <form class="form-inline my-2 my-lg-0">
            <button class="btn btn-outline-success my-2 my-sm-0" type="button" onclick="submitAll()">Submit All</button>
        </form>
    </div>
</nav>

<div class="container">
    <form class="form-inline" id="form" action="#">
        <div class="table-responsive">
            <table class="table">
                <thead>
                <tr>
                    <th scope="col">Item</th>
                    <th scope="col">Text</th>
                    <th scope="col">Background</th>
                    <th scope="col">Display</th>
                    <th scope="col">Submit</th>
                </tr>
                </thead>
                <tbody>
                % for item in overlay_info:
                <tr>
                    <td class="align-middle">
                        {{item}}
                    </td>
                    <td class="align-middle">
                        % if 'text' in overlay_info[item]:
                        <div class="form-group mx-sm-3 mb-2">
                            <label for="{{overlay_name}}-{{item}}-text-form" class="sr-only">{{item}} - Text</label>
                            <input type="text" class="form-control" id="{{overlay_name}}-{{item}}-text-form"
                                   value="{{overlay_info[item]['text']}}">
                        </div>
                        % end
                    </td>
                    <td class="align-middle">
                        % if 'bg' in overlay_info[item]:
                        <div class="form-group mx-sm-3 mb-2">
                            <label for="{{overlay_name}}-{{item}}-bg-form" class="sr-only">{{item}} - Background</label>
                            <select class="form-control" id="{{overlay_name}}-{{item}}-bg-form">
                                % for color in colors:
                                % if color == overlay_info[item]['bg']:
                                <option selected>{{color}}</option>
                                % else:
                                <option>{{color}}</option>
                                % end
                                % end
                            </select>
                        </div>
                        % end
                    </td>
                    <td class="align-middle">
                        % if 'display' in overlay_info[item]:
                        <div class="custom-control custom-checkbox mx-sm-3 mb-2">
                            % if 'show' in overlay_info[item]['display']:
                            <input type="checkbox" class="custom-control-input"
                                   id="{{overlay_name}}-{{item}}-display-form"
                                   checked>
                            % else:
                            <input type="checkbox" class="custom-control-input"
                                   id="{{overlay_name}}-{{item}}-display-form">
                            % end
                            <label class="custom-control-label"
                                   for="{{overlay_name}}-{{item}}-display-form">Show</label>
                        </div>
                        % end
                    </td>
                    <td class="align-middle">
                        <button type="button" class="btn btn-primary mx-sm-3 mb-2"
                                onclick="update('{{ overlay_name }}', '{{item}}')">Update
                        </button>
                    </td>
                    % end
                </tbody>
            </table>
        </div>
    </form>
</div>
</body>
</html>
