{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3">
    <div class="row">
        <div class="col-sm-12">
            <h3>Movies</h3>
            <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Description</th>
                            <th scope="col">Year</th>
                            <th scope="col">Rating</th>
                            {if $login}
                            <th scope="col">Options</th>
                                
                            {/if}
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$movies item=movie}
                        <tr>
                            <th scope="row">{$movie["name"]}</th>
                            <td>{$movie["description"]}</td>
                            <td>{$movie["year"]}</td>
                            <td>{$movie["rating"]}</td>
                            {if $login}
                               <td>
                                <a href="../delete-movie/{$movie['id_movie']}">Delete</a> | 
                                <a href="../edit-movie/{$movie['id_movie']}">Edit</a>
                            </td> 
                            {/if}
                            
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>

{include file="footer.tpl"}