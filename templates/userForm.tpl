{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3">

    <h2>{$subtitle}</h2>

    <form method="post" action={$link}{$action}>
        
        {if $subtitle eq "Reset Password"}
            <input type="hidden" name="email" value="{$user['email']}">
            <div class="form-group">
                <input type="email" class="form-control" id="user" aria-describedby="user" placeholder="Name@example.com" value="{$user['email']}" disabled>
            </div>
        {else}
            <div class="form-group">
                <input type="email" class="form-control" id="user" aria-describedby="user" placeholder="Name@example.com" name="email" value="{$user['email']}" required>
            </div>
        {/if}
        
        <div class="form-group">
            <input type="password" class="form-control" id="password" placeholder="Password" name="password" required>
        </div>
        
        <p class='text-danger'>{$message}</p>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>

    {if $subtitle eq 'Login'}
        <a href='{$link}recover-password'>Recover password</a>
    {/if}

</div>

{include file="footer.tpl"}