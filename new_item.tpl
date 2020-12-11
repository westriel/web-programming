<html>
<head>
    <title>New Task</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <style>
        .selected {
            pointer-events: none;
        }
    </style>
</head>

<body>
    <div class="w3-container w3-teal">
        <h2 class="w3-center">New Item</h2>
    </div>
    %include("header.tpl", session=session, current="")
    %include("show_list_options.tpl", loc="update", old=old)

    %if not old:
    <form class="w3-container" action="/new_item" method="POST">
    %else:
    <form class="w3-container" action="/new_item?old=true" method="POST">
    %end
        <p>
            <input class="w3-input" type="text" size="100" maxlength="100" name="new_task"/>
        </p>
        <p>
            <button class="w3-button w3-block w3-teal w3-hover-purple">Save</button>
        </p>
    </form>
</body>
</html>