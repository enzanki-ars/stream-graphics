<!DOCTYPE html>
<html>
<head>
    <title>enzanki_ars's Stream Graphics (v4) - Admin</title>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
          integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.min.js"
            integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
            integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
            crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
            integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
            crossorigin="anonymous"></script>


    <script src="https://cdnjs.cloudflare.com/ajax/libs/socket.io/2.1.0/socket.io.js"
            integrity="sha256-Thm9kMI2BQKxVnCWipQIGeb8QVl2lohO+WWWfCiF8b0=" crossorigin="anonymous"></script>
    <script src="assets/js/form.js"></script>
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
            <li class="nav-item">
                <a class="nav-link" href="/admin">Admin</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/background">Background</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="/overlay">Overlay</a>
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
                % for item in overlay:
                <tr>
                    <td class="align-middle">
                        {{item}}
                    </td>
                    <td class="align-middle">
                        % if 'text' in overlay[item]:
                        <div class="form-group mx-sm-3 mb-2">
                            <label for="{{item}}-text-form" class="sr-only">{{item}} - Text</label>
                            <input type="text" class="form-control" id="{{item}}-text-form"
                                   value="{{overlay[item]['text']}}">
                        </div>
                        % end
                    </td>
                    <td class="align-middle">
                        % if 'bg' in overlay[item]:
                        <div class="form-group mx-sm-3 mb-2">
                            <label for="{{item}}-bg-form" class="sr-only">{{item}} - Background</label>
                            <select class="form-control" id="{{item}}-bg-form">
                                % for color in colors:
                                % if color == overlay[item]['bg']:
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
                        % if 'display' in overlay[item]:
                        <div class="custom-control custom-checkbox mx-sm-3 mb-2">
                            % if 'show' in overlay[item]['display']:
                            <input type="checkbox" class="custom-control-input" id="{{item}}-display-form" checked>
                            % else:
                            <input type="checkbox" class="custom-control-input" id="{{item}}-display-form">
                            % end
                            <label class="custom-control-label" for="{{item}}-display-form">Show</label>
                        </div>
                        % end
                    </td>
                    <td class="align-middle">
                        <button type="button" class="btn btn-primary mx-sm-3 mb-2" onclick="update('{{item}}')">Update
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
