<html>
    <head>
        <title>Ajax Demo Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>

            $(document).ready( function() {
                // $("#my_text").text("Hello from jQuery") // Selects the item with id my_text, no html, pure text
                // $("#my_text").html("<b>Hello from jQuery</b>") // Selects the item with id my_text, allows html
                // $("#my_text").load("http://dev-westriel.pythonanywhere.com/static/data.txt") // Ajax call
                $("#my_text").getJSON("http://dev-westriel.pythonanywhere.com/static/data.json", function() {
                    console.log(result)
                }) // Ajax JSON call
            })
        </script>
    </head>

    <body>
        Hello from the sandbox
        <hr/>
        <div id="special_section">This is a special section<hr/></div>
        <div id="super_special_section" hidden>This is a super special section<hr/></div>
        <div id="my_text">MY DIV</div>
        <hr/>
    </body>
</html>