{include file="header.tpl"}

<nav class="navbar navbar-expand-lg navbar-light bg-primary">
        <a class="navbar-brand" href='./'><h1>Movies</h1></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="./">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="./all-movies/">All Movies <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            
            {if $login}
                <span class="navbar-text">
                    Welcome {$username}
                </span>
                <a class="btn btn-primary" href="./logout" role="button">Logout</a>
                {else}
                    <div>
                        <a class="btn btn-primary" href="./login" role="button">Login</a>
                        <a class="btn btn-primary" href="./register" role="button">Register</a>
                    </div>
            {/if}
        </div>
    </nav>

<div class="container mt-3">

    <h2>{$subtitle}</h2>

    <form method="post" action={$action}>
        <input type='hidden' name="img" value={$img}>
        <input type="hidden" name="id_movie" value={$id}>
        <div class="form-group">
            <input type="text" class="form-control" id="name" placeholder="Name" name="name" value='{$movie["name"]}'>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="description" placeholder="Description" name="description" value='{$movie["description"]}' maxlength="600">
        </div>

        <div class="form-group">
            <select class="custom-select" id="genre" name="id_genre">
                {foreach from=$genres item=genre}
                <option value={$genre["id_genre"]}>{$genre['name']}</option>
                {/foreach}
            </select>
        </div>

        <div class="form-group">
            <input type="number" class="form-control" id="movieYear" placeholder="Year" name="year" value='{$movie["year"]}'>
        </div>
        <div class="form-group">
            <input type="number" class="form-control" id="rating" placeholder="Rating" name="rating" value='{$movie["rating"]}'>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

{include file="footer.tpl"}