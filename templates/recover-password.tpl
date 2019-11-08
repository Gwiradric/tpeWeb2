{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3">

    <h2>{$subtitle}</h2>

    <form method="post" action="{$link}send-message">
        
        <div class="form-group">
            <input type="email" class="form-control" id="user" aria-describedby="user" placeholder="Name@example.com" name="username" required>
        </div>
    
        <p class='text-danger'>{$message}</p>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

{include file="footer.tpl"}