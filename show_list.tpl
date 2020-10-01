<h3>Basic Todo List, version 1.1</h3>
<hr/>
<table border="1">
%for row in rows:
    <tr>
            <td>{{str(row[0])}}</td>
            <td>
                <a href="/update_item/{{row[0]}}">
                    {{row[1]}}
                </a>
            </td>
            <td>
            %if row[2] == 0:
                <a href="/set_status/{{row[0]}}/1">[ {{str(row[2])}} ]</a>
            %else:
                <a href="/set_status/{{row[0]}}/0">[ {{str(row[2])}} ]</a>
            %end
            </td>
            <td>
                <a href="/delete_item/{{row[0]}}">Delete</a>
            </td>
    </tr>
%end
</table>
<hr/>
<a href="/new_item">New Item... :-)</a>