{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3">

    <h2>{$subtitle}</h2>

    <form method="post" action={$action}>
        
        <div class="form-group">
            <input type="text" class="form-control" id="user" aria-describedby="user" placeholder="Username" name="username" required>
        </div>
        
        <div class="form-group">
            <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
        </div>
        
        <p class='text-danger'>{$message}</p>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

{include file="footer.tpl"}