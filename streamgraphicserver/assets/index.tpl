<!DOCTYPE html>
<html>
<head>
    <title>enzanki_ars's Stream Graphics (v4)</title>

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


</head>
<body>

<nav class="navbar sticky-top navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav"
            aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav">
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
                            <label for="default-overlay-list3" class="sr-only">Default Overlays</label>
                            <select class="form-control" name="base_name" id="default-overlay-list3">
                                % for overlay in default_overlays:
                                <option>{{overlay}}</option>
                                % end
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="exampleDropdownForm3">New Name</label>
                            <input type="text" class="form-control" id="exampleDropdownForm3" name="new_name"
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
    </div>
</nav>

<div class="container">
    <div class="jumbotron">
        <h1 class="display-4">
            enzanki_ars's Stream Graphics (v4.0.0)
        </h1>
        <p class="lead">
            These are the current graphics for streams on YouTube, Twitch, Periscope, and more.
        </p>
        <hr class="my-4">
        <p>
            Select a page to navigate to below.
        </p>
        <div class="lead">
            <div class="btn-group">
                <div class="dropdown">
                    <a class="btn btn-primary btn-lg dropdown-toggle" href="#" role="button" id="dropdownMenuLink"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Admin
                    </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
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
                </div>
            </div>

            <div class="btn-group">
                <div class="dropdown">
                    <a class="btn btn-secondary btn-lg dropdown-toggle" href="#" role="button" id="dropdownMenuLink2"
                       data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        Overlay
                    </a>

                    <div class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <form class="px-4 py-3" action="/copy-default-overlay">
                            <div class="form-group">
                                <label for="default-overlay-list4" class="sr-only">Default Overlays</label>
                                <select class="form-control" name="base_name" id="default-overlay-list4">
                                    % for overlay in default_overlays:
                                    <option>{{overlay}}</option>
                                    % end
                                </select>
                            </div>
                            <div class="form-group">
                                <label for="exampleDropdownForm4">New Name</label>
                                <input type="text" class="form-control" id="exampleDropdownForm4" name="new_name"
                                       placeholder="New Name">
                            </div>
                            <button type="submit" class="btn btn-primary">Copy</button>
                        </form>
                        <div class="dropdown-divider"></div>
                        % for overlay in user_overlays:
                        <a class="dropdown-item" href="/overlay/{{overlay}}">{{overlay}}</a>
                        % end
                    </div>
                </div>
            </div>

            <div class="btn-group">
                <a class="btn btn-secondary btn-lg" href="/background" role="button">Background</a>
            </div>
        </div>
    </div>
</div>


</body>
</html>
