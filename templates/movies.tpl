{include file="header.tpl"}

<body>

    <header>
        <h1 class="mainTitle">{$title}</h1>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h3>List of Movies</h3>
                <ul class="list-group">
                    {foreach from=$movies item=movie}
                        <li class="list-group-item">{$movie["nombre"]}: {$movie["descripcion"]}</li>
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>

{include file="footer.tpl"}