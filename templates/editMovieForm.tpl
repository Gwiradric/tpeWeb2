{include file="header.tpl"}


{include file="navbar.tpl"}

<div class="container mt-3">
    <form method="post" action="../edit-movies">
        <input type="hidden" name="id_movie" value={$id[0]}>
        <div class="form-group">
            <input type="text" class="form-control" id="name" placeholder="Name" name="name" value='{$movie["name"]}'>
        </div>
        <div class="form-group">
            <input type="text" class="form-control" id="description" placeholder="Description" name="description" value='{$movie["description"]}'>
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