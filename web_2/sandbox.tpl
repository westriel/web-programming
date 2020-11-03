<html>
<head>
    <title>Its a Sandbox!</title>
    <script>
        x = 1;
        function onMyTextClick() {
            document.getElementById("my_text").innerHTML="I have been clicked " + x++ + " times";
        };
        function onSuperSpecialSectionClick() {
            document.getElementById("super_special_section").hidden=false;
        };
        function onSpecialSectionClick() {
            val =  document.getElementById("special_section").style.display
            console.log(val);
            if(val === "none") {
                document.getElementById("special_section").style.display = "block";
            } else {
                document.getElementById("special_section").style.display = "none";
            }
        };
    </script
</head>

<body>
    Hello from the sandbox
    <hr/>
    <div id="special_section">This is a special section<hr/></div>
    <div id="super_special_section" hidden>This is a super special section<hr/></div>
    <div id="my_text">MY DIV</div>
    <hr/>
    <button type="button" onclick='onMyTextClick();'>Click Me!</button>
    <button type="button" onclick='onSpecialSectionClick();'>Toggle Special Section</button>
    <button type="button" onclick='onSuperSpecialSectionClick();'>Show Super Special Section</button>
</body>
</html>