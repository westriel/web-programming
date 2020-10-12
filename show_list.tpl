<html>
<head>
    <title>Todo List 0.003</title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons"/>
    <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css"/>

    <style>
        a:link, a:visited {
            color: teal !important;
            text-decoration: none;
        }

        a:hover, a:active {
            color: purple !important;
            text-decoration: underline;
        }
    </style>
</head>

<body>
    <div class="w3-container w3-teal">
        <h3 class="w3-center">Basic Todo List, version 1.2</h3>
    </div>

    <table class="w3-table w3-striped">
    %for row in rows:
        <tr>
            <!--<td>{{str(row[0])}}</td>-->
            <td>
                <a href="/update_item/{{row[0]}}">
                    <i class="material-icons">edit</i>
                </a>
            </td>
            <td>
                {{row[1]}}
            </td>
            <td>
            %if row[2] == 0:
                <a href="/set_status/{{row[0]}}/1"><i class="material-icons">check_box_outline_blank</i></a>
            %else:
                <a href="/set_status/{{row[0]}}/0"><i class="material-icons">check_box</i></a>
            %end
            </td>
            <td>
                <a href="/delete_item/{{row[0]}}"><i class="material-icons">delete</i></a>
            </td>
        </tr>
    %end
    </table>
    <a href="/new_item"><button class="w3-button w3-block w3-teal w3-hover-purple">New Item...</button></a>
</body>
</html>