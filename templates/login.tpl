{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3">

    <h3>Login</h3>

    <form method="post" action=check-login>
        
        <div class="form-group">
            <input type="text" class="form-control" id="user" aria-describedby="user" placeholder="Username" name="username">
        </div>
        
        <div class="form-group">
            <input type="password" class="form-control" id="password" placeholder="Password" name="password">
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
    <p class="text-danger">{$message}</p>
</div>

{include file="footer.tpl"}