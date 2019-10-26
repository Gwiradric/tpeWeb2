{include file="header.tpl"}

<nav class="navbar navbar-expand-lg navbar-light bg-primary">
        <a class="navbar-brand" href='./'><h1>Movies</h1></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        {* <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Features</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="#">Pricing</a>
                </li>
            </ul>
            <span class="navbar-text">
                Navbar text with an inline element
            </span>
        </div> *}
    </nav>

<div class="container mt-3">

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