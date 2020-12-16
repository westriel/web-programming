<style>
.selected {
    pointer-events: none;
}
</style>

%if session['username'] != "Guest":
<div class="w3-bar w3-teal">
    <!-- Ajax -->
    %if not old:
    <!-- New Item -->
    %if loc == "new":
    <a href="/new_item" class="w3-button w3-bar-item w3-purple w3-hover-purple selected">New Item</a>
    %else:
    <a href="/new_item" class="w3-button w3-bar-item w3-teal w3-hover-purple">New Item</a>
    %end

    <!-- Update Item -->
    %if loc == "update":
    <span class="w3-button w3-bar-item w3-purple w3-hover-purple selected">Update Item</span>
    %end

    <a href="/" class="w3-button w3-right w3-bar-item w3-purple w3-hover-purple selected">Ajax List</a>
    <a href="/old" class="w3-button w3-right w3-bar-item w3-teal w3-hover-purple">Old List</a>
    %else:
    <!-- Old -->
    <!-- New Item -->
    %if loc == "new":
    <a href="/new_item?old=true" class="w3-button w3-bar-item w3-purple w3-hover-purple selected">New Item</a>
    %else:
    <a href="/new_item?old=true" class="w3-button w3-bar-item w3-teal w3-hover-purple">New Item</a>
    %end

    <!-- Update Item -->
    %if loc == "update":
    <span class="w3-button w3-bar-item w3-purple w3-hover-purple selected">Update Item</span>
    %end

    <a href="/" class="w3-button w3-right w3-bar-item w3-teal w3-hover-purple">Ajax List</a>
    <a href="/old" class="w3-button w3-right w3-bar-item w3-purple w3-hover-purple selected">Old List</a>
    %end
</div>
%end