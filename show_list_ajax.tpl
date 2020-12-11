<html>
<head>
    <title>Todo List 0.004</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

    <style>
        .my_class {
            color: teal;
            cursor: pointer;
            text-decoration: none;
        }

        .my_class:hover, .my_class:active {
            color: purple;
        }
    </style>

    <script>
        function setStatus(id, status) {
            console.log(`Setting status of ${id} to ${status}`)
            $.ajax(`https://dev-westriel.pythonanywhere.com/set_status/${id}/${Number(status)}`).done(function() {
                getTable();
            });
        }

        function deleteItem(id) {
            console.log(`Removing ${id}`)
            $.ajax(`https://dev-westriel.pythonanywhere.com/delete_item/${id}`).done(function() {
                getTable();
            });
        }

        function getTable() {
            console.log("Creating Table")
            $.getJSON("https://dev-westriel.pythonanywhere.com/get_tasks", function(rows) {
                table = "<table class=\"w3-table w3-striped\">";
                $.each(rows, function(i, row) {
                    table += `
<tr>
    <td><a href="/update_item/${row["id"]}" class="my_class">
        <i class="material-icons">edit</i>
    </a></td>
    <td>${row["task"]}</td>
    <td><span class="my_class" onclick="setStatus(${row['id']}, ${!row['status']})">
        <i class="material-icons">${row['status'] ? "check_box" : "check_box_outline_blank"}</i>
    </span></td>
    <td><span class="my_class" onclick="deleteItem(${row['id']})">
        <i class="material-icons">delete</i>
    </span></td>
</tr>`
                });
                table += "</table>";
                setTable(table);
            });
        }

        function setTable(table) {
            console.log("Setting Table")
            $("#content").html(table);
        }

        $(document).ready(getTable);
        </script>
</head>

<body>
    <div class="w3-container w3-teal">
        <h3 class="w3-center">Basic (ajax) Todo List, version 1.4</h3>
    </div>
    %include("header.tpl", session=session, current="list")
    <div class="w3-bar w3-teal">
        <a href="/new_item" class="w3-button w3-bar-item w3-teal w3-hover-purple">New Item</a>
    </div>

    <div id=content>Loading...</div>
</body>
</html>