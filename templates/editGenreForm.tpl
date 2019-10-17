{include file="header.tpl"}

<body>

<header>
    <h1 class="mainTitle">{$title}</h1>
</header>

<div class="container">
        <form method="post" action="../edit-genre">
            <input type="hidden" name="id_genre" value={$id[0]}>
            <div class="form-group">
                <input type="text" class="form-control" id="name" aria-describedby="name"
                    placeholder="Name" name="name">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="description" placeholder="Description" name="description">
            </div>
            
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>
</body>

{include file="footer.tpl"}