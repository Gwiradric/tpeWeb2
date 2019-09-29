{include file="header.tpl"}

<body>

    <header>
        <h1 class="mainTitle">{$title}</h1>
    </header>


    <div class="container">
        <div class="row">
            <div class="col-sm-6">
                <h3>Formulario Generos</h3>
                <form method="post" action="add">
                    <div class="form-group">
                        <label for="titleForm">Title</label>
                        <input type="text" class="form-control" id="title" name="title">
                    </div>
                    <div class="form-group">
                        <label for="descriptionForm">Description</label>
                        <input type="text" class="form-control" id="description" name="description">
                    </div>
                    <button type="submit" class="btn btn-primary">Add Genre</button>
                </form>
            </div>

            <div class="col-sm-6">
                <h3>Genres</h3>
                <ul class="list-group">
                    {foreach from=$genres item=genre}
                        <li class="list-group-item">{$genre["nombre"]}: {$genre["descripcion"]} | <a href="delete/{$genre["id_genero"]}">Delete</a></li>
                    {/foreach}
                </ul>
            </div>
        </div>
    </div>

{include file="footer.tpl"}