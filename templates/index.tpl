{include file="header.tpl"}

<body>

    <header>
        <h1 class="mainTitle">{$title}</h1>
    </header>

    <div>
        <a class="btn btn-primary" href="showGenreForm" role="button">Add Genre</a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h3>List of Genres</h3>
                <ul class="list-group">
                    {foreach from=$genres item=genre}
                        <li class="list-group-item"><a href="showMovies/{$genre["id_genre"]}">{$genre["name"]}</a>: {$genre["description"]} | <a href="deleteGenre/{$genre["id_genre"]}">Delete</a></li>
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>

{include file="footer.tpl"}