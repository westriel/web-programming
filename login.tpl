<html>
<head>
    <title>Login</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
</head>

<body>
    <div class="w3-container w3-teal">
        <h2 class="w3-center">Login</h2>
    </div>

    <form class="w3-container" action="/login" method="POST">
        <p>
            Username: <input class="w3-input" type="text" size="100" maxlength="100" name="username"/>
            Password: <input class="w3-input" type="text" size="100" maxlength="100" name="password"/>
        </p>
        <p>
            <button class="w3-button w3-block w3-teal w3-hover-purple">Save</button>
            <!--<input type="submit" name="save" value="Save"/>-->
        </p>
    </form>
</body>
</html>