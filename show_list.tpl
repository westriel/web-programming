<html>
<head>
    <title>Todo List 0.004</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>

    <style>
        .my_class:link, .my_class:visited {
            color: teal;
            text-decoration: none;
        }

        .my_class:hover, .my_class:active {
            color: purple;
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="w3-container w3-teal">
        <h2 class="w3-center">Basic Todo List, version 1.4</h2>
    </div>
    %include("header.tpl", session=session, current="list")
    <a href="/new_item?old=true" class="w3-button w3-block w3-teal w3-hover-purple">New Item</a>

    <table class="w3-table w3-striped">
    %for row in rows:
        <tr>

            <td>
                <a href="/update_item/{{row['id']}}?old=true" class="my_class">
                    <i class="material-icons">edit</i>
                </a>
            </td>
            <td>
                {{row['task']}}
            </td>
            <td>
            %if row['status'] == 0:
                <a href="/set_status/{{row['id']}}/1?old=true" class="my_class"><i class="material-icons">check_box_outline_blank</i></a>
            %else:
                <a href="/set_status/{{row['id']}}/0?old=true" class="my_class"><i class="material-icons">check_box</i></a>
            %end
            </td>
            <td>
                <a href="/delete_item/{{row['id']}}?old=true" class="my_class"><i class="material-icons">delete</i></a>
            </td>
        </tr>
    %end
    </table>
</body>
</html>