<html>
<head>
    <title>Update Task</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
</head>

<body>
    <div class="w3-container w3-teal">
        <h2 class="w3-center">Update Item</h2>
    </div>
    %include("header.tpl", session=session, current="")
    <div class="w3-bar w3-teal">
        <a href="/new_item" class="w3-button w3-bar-item w3-teal w3-hover-purple">New Item</a>
        <a href="/new_item" class="w3-button w3-bar-item w3-purple w3-hover-purple selected">Update Item</a>
    </div>

    %if not old:
    <form class="w3-container" action="/update_item" method="POST">
    %else:
    <form class="w3-container" action="/update_item?old=true" method="POST">
    %end
        <input type="text" size="100" maxLength="100" name="id" value="{{str(row['id'])}}" hidden/>
        <p>
            <input class="w3-input" type="text" size="100" maxlength="100" name="updated_item" value="{{row['task']}}"/>
        </p>
        <p>
            <div class="w3-bar">
                <button class="w3-bar-item w3-button w3-block w3-teal w3-hover-purple" style="width:50.0%">Update</button>
                <a class="w3-bar-item w3-button w3-block w3-purple w3-hover-teal" style="text-decoration: none; width:50.0%" href="/">Cancel</a>
            </div>
        </p>
    </form>
</body>
</html>