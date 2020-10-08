<html>
<head>
    <title>Update Task</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
</head>

<body>
    <div class="w3-container w3-teal">
        <h2 class="w3-center">Update Task</h2>
    </div>

    <form class="w3-container" action="/update_item" method="POST">
        <input type="text" size="100" maxLength="100" name="id" value="{{str(row[0])}}" hidden/>
        <p>
            <input class="w3-input" type="text" size="100" maxlength="100" name="updated_item" value="{{row[1]}}"/>
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