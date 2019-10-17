{include file="header.tpl"}

<div class="container">
        <form method="post" action="./add-movie">
            <div class="form-group">
                <input type="text" class="form-control" id="name"
                    placeholder="Name" name="name">
            </div>
            <div class="form-group">
                <input type="text" class="form-control" id="description" placeholder="Description" name="description">
            </div>

            <div class="form-group">
                <select class="custom-select" id="genre" name="id_genre">
                {* {foreach from=$genres item=genre}
                    <option>{$genre['id_genre']}</option>
                {/foreach} *}
                <option selected>Select Genre</option>
                {foreach from=$genres item=genre}
                    <option value={$genre["id_genre"]}>{$genre['name']}</option>
                {/foreach}
                </select>

            </div>

            

            <div class="form-group">
                <input type="number" class="form-control" id="movieYear" placeholder="Year" name="year">
            </div>
            <div class="form-group">
                <input type="number" class="form-control" id="rating" placeholder="Rating" name="rating">
            </div>
            
            <button type="submit" class="btn btn-primary">Submit</button>
        </form>
    </div>

    {include file="footer.tpl"}