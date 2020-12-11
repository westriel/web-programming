<html>
<head>
    <title>Register Error</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
</head>

<body>
    <div class="w3-container w3-teal">
        <h2 class="w3-center">Error</h2>
    </div>

    <form class="w3-container" action="/register" method="GET">
        %if error == "username":
        <p>Username already in use, please try again</p>
        %elif error == "password":
        <p>Password must be at least 8 characters long, please try again</p>
        %else:
        <p>Registration error, please try again</p>
        %end
        <p><button class="w3-button w3-block w3-teal w3-hover-purple">Ok</button></p>
    </form>
</body>
</html>