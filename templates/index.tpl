{include file="header.tpl"}

<body>

    <header>
        <h1 class="mainTitle">{$title}</h1>
    </header>

    <div>
        <a class="btn btn-primary" href="form" role="button">Add Genre</a>
        <a class="btn btn-primary" href="form-movies" role="button">Add Movie</a>
    </div>
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h3>List of Genres</h3>
                <ul class="list-group">
                    <table class="table table-striped">
                    <thead>
                        <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$genres item=genre}
                            <tr>
                            <th scope="row"><a href="movies/{$genre["id_genre"]}">{$genre["name"]}</a></th>
                            <td>{$genre["description"]}</td>
                            <td>
                                <a href='./delete/{$genre["id_genre"]}'>Delete</a> | 
                                <a href='./edit/{$genre["id_genre"]}'>Edit</a>
                            </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>
                </ul>
            </div>
        </div>
    </div>

{include file="footer.tpl"}