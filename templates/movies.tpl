{include file="header.tpl"}

<body>

    <header>
        <h1 class="mainTitle">{$title}</h1>
    </header>

    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <h3>Movies</h3>

                <table class="table table-striped">
                    <thead>
                        <tr>
                        <th scope="col">Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Year</th>
                        <th scope="col">Rating</th>
                        <th scope="col">Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$movies item=movie}
                            <tr>
                            <th scope="row">{$movie["name"]}</th>
                            <td>{$movie["description"]}</td>
                            <td>{$movie["year"]}</td>
                            <td>{$movie["rating"]}</td>
                            <td>
                                <a href="../delete-movie/{$movie['id_movie']}">Delete</a>
                                <a href="../edit-movie/{$movie['id_movie']}">Edit</a>
                            </td>
                            </tr>
                        {/foreach}
                    </tbody>
                </table>

            </div>
        </div>
    </div>

{include file="footer.tpl"}