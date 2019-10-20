{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3">

    <form method="post" action={$action}>
        
        <div class="form-group">
            <input type="text" class="form-control" id="user" aria-describedby="user" placeholder="Username" name="username" value="{$user['username']}">
        </div>
        
        <div class="form-group">
            <input type="password" class="form-control" id="password" placeholder="Password" name="password" value="{$user['password']}">
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

{include file="footer.tpl"}