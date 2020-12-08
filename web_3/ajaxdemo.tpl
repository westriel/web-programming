<html>
<head>
    <title>Ajax Demo Page</title>
    <script>
        function onLoad() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function() {
                if(this.readyState == 4 && this.status == 200) { // Means we're done and status 200 means web request is good
                    content = this.responseText;
                    document.getElementById("my_text").innerHTML=content;
                } else {
                    document.getElementById("my_text").innerHTML = "Loading..."
                }
            }
            xhttp.open("GET", "http://dev-westriel.pythonanywhere.com/static/data.txt", true); // true means synchronous, false means async
            xhttp.send()
        };
    </script>
</head>

<body onload='onLoad();'>
    Hello from the sandbox
    <hr/>
    <div id="special_section">This is a special section<hr/></div>
    <div id="super_special_section" hidden>This is a super special section<hr/></div>
    <div id="my_text">MY DIV</div>
    <hr/>
</body>
</html>