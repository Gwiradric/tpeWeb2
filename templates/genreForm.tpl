{include file="header.tpl"}

{include file="navbar.tpl"}

{* <div class="container mt-3">

    <form method="post" action={$action}>
        
        
        {if $id != -1}
                <input type="hidden" name="id_genre" value={$id}>
                <div class="form-group">
                    <input type="text" class="form-control" id="name" aria-describedby="name" placeholder="Name" name="name" value="{$genre['name']}">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="description" placeholder="Description" name="description" value="{$genre['description']}">
                </div>
        {else}
                <div class="form-group">
                    <input type="text" class="form-control" id="name" aria-describedby="name" placeholder="Name" name="name">
                </div>
                <div class="form-group">
                    <input type="text" class="form-control" id="description" placeholder="Description" name="description">
                </div>
        {/if}

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div> *}

{include file="footer.tpl"}