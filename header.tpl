<style>
.selected {
    pointer-events: none;
}
</style>

<div class="w3-bar w3-teal">

    <!-- Home -->
    %if current == "list":
        <a href="/" class="w3-bar-item w3-button w3-left w3-purple w3-hover-purple selected">Home</a>
    %else:
        <a href="/" class="w3-bar-item w3-button w3-left w3-hover-purple">Home</a>
    %end

    %if session['username'] != "Guest":
        <!-- Picture -->
        <a href="/picture" class="w3-bar-item w3-button w3-left w3-hover-purple">Picture</a>

        <!-- Ajax -->
        %if current == "ajax":
        <a href="/ajaxdemo" class="w3-bar-item w3-button w3-left w3-purple w3-hover-purple selected">Ajax</a>
        %else:
            <a href="/ajaxdemo" class="w3-bar-item w3-button w3-left w3-hover-purple">Ajax</a>
        %end

        <!-- jQuery -->
        %if current == "jquery":
            <a href="/jquerydemo" class="w3-bar-item w3-button w3-left w3-purple w3-hover-purple selected">jQuery</a>
        %else:
            <a href="/jquerydemo" class="w3-bar-item w3-button w3-left w3-hover-purple">jQuery</a>
        %end

        <!-- Sandbox -->
        %if current == "sandbox":
            <a href="/sandbox" class="w3-bar-item w3-button w3-left w3-purple w3-hover-purple selected">Sandbox</a>
        %else:
            <a href="/sandbox" class="w3-bar-item w3-button w3-left w3-hover-purple">Sandbox</a>
        %end

        <a href="/logout" class="w3-bar-item w3-button w3-right w3-hover-purple">Logout</a>
        <a class="w3-bar-item w3-right w3-teal">Hello, {{session['username']}}</a>
    %else:
    <a href="/login" class="w3-bar-item w3-button w3-center w3-hover-purple">Login</a>
    <a href="/register" class="w3-bar-item w3-button w3-center w3-hover-purple">Register</a>
    %end
</div>