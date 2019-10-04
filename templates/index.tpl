{include file="header.tpl"}

<body>

    <header>
        <h1 class="mainTitle">{$title}</h1>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h3>List of Genres</h3>
                <ul class="list-group">
                    {foreach from=$genres item=genre}
                        <li class="list-group-item"><a href="movies/{$genre["id_genero"]}">{$genre["nombre"]}</a>: {$genre["descripcion"]} | <a href="delete/{$genre["id_genero"]}">Delete</a></li>
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>

{include file="footer.tpl"}