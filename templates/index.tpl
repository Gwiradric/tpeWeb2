{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3">
    <div class="row">
        <div>
            <a class="btn btn-primary" href="all-movies/" role="button">All movies</a>
            {if $login}
            <a class="btn btn-primary" href="add-genre" role="button">Add Genre</a>
            <a class="btn btn-primary" href="add-movie" role="button">Add Movie</a>
            <a class="btn btn-primary" href="logout" role="button">Logout</a>
            {else}
            <a class="btn btn-primary" href="add-user" role="button">Register</a>
            <a class="btn btn-primary" href="login" role="button">Login</a>
            {/if}
        </div>
    </div>
    <div class="row">
        <div class="col-sm-12 mt-2">
            <h3>List of Genres</h3>
            <table class="table table-striped">
                <thead>
                    <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        {if $login}
                        <th scope="col">Options</th>
                        {/if}
                    </tr>
                </thead>
                <tbody>
                    {foreach from=$genres item=genre}
                    <tr>
                        <th scope="row"><a href='movies/{$genre["id_genre"]}'>{$genre["name"]}</a></th>
                        <td>{$genre["description"]}</td>
                        {if $login}
                            <td>
                                <a href='./delete-genre/{$genre["id_genre"]}'>Delete</a> |
                                <a href='./edit-genre/{$genre["id_genre"]}'>Edit</a>
                            </td>
                        {/if}
                        
                    </tr>
                    {/foreach}
                </tbody>
            </table>
        </div>
    </div>
</div>

{include file="footer.tpl"}