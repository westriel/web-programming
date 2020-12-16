<html>
    <head>
        <title>jQuery Demo Page</title>
        <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>

            $(document).ready( function() {
                // $("#my_text").text("Hello from jQuery") // Selects the item with id my_text, no html, pure text
                // $("#my_text").html("<b>Hello from jQuery</b>") // Selects the item with id my_text, allows html
                // $("#my_text").load("http://dev-westriel.pythonanywhere.com/static/data.txt") // Ajax call
                $.getJSON("https://dev-westriel.pythonanywhere.com/static/data.json", function(result) {
                    var list = "<ul>"
                    $.each(result, function(i, field) {
                        console.log(i, field["fruit"]);
                        list = list + "<li>" + field["fruit"] + "</li>";
                    })
                    list = list + "</ul>"
                    console.log(list);
                    $("#content").html(list);
                    console.log(result);
                }) // Ajax JSON call
            })
        </script>
    </head>

    <body>
    <div class="w3-container w3-teal">
        <h2 class="w3-center">Hello from the sandbox</h2>
    </div>
    %include("header.tpl", session=session, current="jquery")
        <hr/>
        <div id="content">MY DIV</div>
        <hr/>
    </body>
</html>