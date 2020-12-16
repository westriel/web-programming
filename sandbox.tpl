<html>
<head>
    <title>Its a Sandbox!</title>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <script>
        x = 0;
        function onMyTextClick() {
            ++x;
            myStr = "";
            if(x % 100 == 69) {
                myStr = `I have been clicked ${x} time${x == 1 ? "":"s"} ;)`;
            } else if (x == 404) {
                myStr = `404, count not found`;
            } else if (x == 413) {
                myStr = `| h4v3 b33n c1ick3d ${x} t|m35.`;
            } else {
                myStr = `I have been clicked ${x} times.`
            }
            document.getElementById("my_text").innerHTML = myStr;
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
        <h2 class="w3-center">Sandbox</h2>
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