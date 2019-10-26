{include file="header.tpl"}

<nav class="navbar navbar-expand-lg navbar-light bg-primary">
        <a class="navbar-brand" href='./'><h1>Movies</h1></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="./">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="all-movies/">All Movies</a>
                </li>
            </ul>
            
            {if $login}
                <span class="navbar-text">
                    Welcome {$username}
                </span>
                <a class="btn btn-primary" href="logout" role="button">Logout</a>
                {else}
                    <div>
                        <a class="btn btn-primary" href="login" role="button">Login</a>
                        <a class="btn btn-primary" href="register" role="button">Register</a>
                    </div>
            {/if}
        </div>
</nav>


<div class="container mt-3">

    <h3>List of Genres</h3>
    
    <div class="row">
            {if $login}
                <div class="col-sm-10 mt-2">
            {else}
                <div class="col-sm-12 mt-2">
            {/if}
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
            {if $login}
                <div class="col-sm-2">
                    <table class="table">
                        <thead>
                            <tr>
                                <th scope="col">Admin panel</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td><a href="add-genre">Add Genre</a></td>
                            </tr>
                            <tr>
                                <td><a href="add-movie">Add Movie</a></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            {/if}
    </div>
</div>
</div>

{include file="footer.tpl"}