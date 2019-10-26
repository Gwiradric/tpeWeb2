{include file="header.tpl"}

<nav class="navbar navbar-expand-lg navbar-light bg-primary">
        <a class="navbar-brand" href='../'><h1>Movies</h1></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="../">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../all-movies/">All Movies <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            
            {if $login}
                <span class="navbar-text">
                    Welcome {$username}
                </span>
                <a class="btn btn-primary" href="../logout" role="button">Logout</a>
                {else}
                    <div>
                        <a class="btn btn-primary" href="../login" role="button">Login</a>
                        <a class="btn btn-primary" href="../register" role="button">Register</a>
                    </div>
            {/if}
        </div>
    </nav>

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
                            <th scope="row"><a href="../movie/{$movie['id_movie']}">{$movie["name"]}</a></th>
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