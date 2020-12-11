<html>
<head>
    <title>Ajax Demo Page</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <script>
        function onLoad() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                console.log("State change")
                console.log("Ready State: " + this.readyState + "\nStatus" + this.status)
                if(this.readyState == 4 && this.status == 200) { // Means we're done and status 200 means web request is good
                    content = this.responseText;
                    document.getElementById("my_text").innerHTML=content;
                } else {
                    document.getElementById("my_text").innerHTML = "Loading..."
                }
            }
            xhttp.open("GET", "https://dev-westriel.pythonanywhere.com/static/data.txt", true); // true means synchronous, false means async
            xhttp.send()
        };
    </script>
</head>

<body onload='onLoad();'>
    <div class="w3-container w3-teal">
        <h3 class="w3-center">Hello from the sandbox</h3>
    </div>
    %include("header.tpl", session=session, current="ajax")
    <hr/>
    <div id="my_text">MY DIV</div>
    <hr/>
</body>
</html>