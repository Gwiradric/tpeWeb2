{include file="header.tpl"}

<body>

    <header>
        <h1 class="mainTitle">{$title}</h1>
    </header>

    <div class="container">
        <form method="post" action="movieForm">
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" class="form-control" id="name" aria-describedby="emailHelp"
                    placeholder="Name" name="name">
            </div>
            <div class="form-group">
                <label for="description">Description</label>
                <input type="text" class="form-control" id="description" placeholder="Description" name="description">
            </div>
            <div class="form-group">
                <label for="year">Year</label>
                <input type="number" class="form-control" id="movieYear" placeholder="Year" name="year">
            </div>
            <div class="form-group">
                <label for="rating">Rating</label>
                <input type="number" class="form-control" id="rating" placeholder="Rating" name="rating">
            </div>
            
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    {include file="footer.tpl"}