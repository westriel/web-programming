<html>
    <head>
        <title>jQuery Demo Page</title>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <script>

            $(document).ready( function() {
                // $("#my_text").text("Hello from jQuery") // Selects the item with id my_text, no html, pure text
                // $("#my_text").html("<b>Hello from jQuery</b>") // Selects the item with id my_text, allows html
                // $("#my_text").load("http://dev-westriel.pythonanywhere.com/static/data.txt") // Ajax call
                $.getJSON("https://dev-westriel.pythonanywhere.com/static/data.json", function(result) {
                    $("#content").html("<ul>");
                    $.each(result, function(i, field) {
                        console.log(i, field["fruit"]);
                        $("#content").append("<li>" + field["fruit"] + "</li>");
                    })
                    $("#content").append("</ul>");
                    console.log(result);
                }) // Ajax JSON call
            })
        </script>
    </head>

    <body>
        Hello from the sandbox
        <hr/>
        <div id="content">MY DIV</div>
        <hr/>
    </body>
</html>