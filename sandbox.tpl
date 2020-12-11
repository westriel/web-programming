<html>
<head>
    <title>Its a Sandbox!</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
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
    <div class="w3-container w3-teal">
        <h3 class="w3-center">Sandbox</h3>
    </div>
    %include("header.tpl", session=session, current="sandbox")
    <div class="w3-container">
        Hello from the sandbox
    </div>
    <hr/>
    <div id="special_section" class="w3-container">This is a special section<hr/></div>
    <div id="super_special_section" class="w3-container" hidden>This is a super special section<hr/></div>
    <div id="my_text" class="w3-container">MY DIV</div>
    <hr/>
    <button type="button" onclick='onMyTextClick();'>Click Me!</button>
    <button type="button" onclick='onSpecialSectionClick();'>Toggle Special Section</button>
    <button type="button" onclick='onSuperSpecialSectionClick();'>Show Super Special Section</button>
</body>
</html>