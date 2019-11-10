{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3">

    <h2>{$subtitle}</h2>

    <form method="post" action={$link}{$action} enctype="multipart/form-data">

        <input type='hidden' name="img" value={$img}>

        <input type="hidden" name="id_movie" value={$id}>

        <div class="form-group">
            <input type="text" class="form-control" id="name" placeholder="Name" name="name" value='{$movie["name"]}' required>
        </div>

        <textarea class="form-control" aria-label="With textarea" placeholder="Description" name="description" maxlength="600" required>{$movie["description"]}</textarea>

        <div class="mt-2 form-group">
            <select class="custom-select" id="genre" name="id_genre">
                {foreach from=$genres item=genre}
                <option value={$genre["id_genre"]}>{$genre['name']}</option>
                {/foreach}
            </select>
        </div>

        <div class="form-group">
            <input type="number" class="form-control" id="movieYear" placeholder="Year" name="year" value='{$movie["year"]}' required>
        </div>
        
        <div class="form-group">
            <input type="number" class="form-control" id="rating" placeholder="Rating" name="rating" value='{$movie["rating"]}' required>
        </div>

        <div class="input-group mb-3">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupFileAddon01">Upload</span>
            </div>
            <div class="custom-file">
                <input type="file" class="custom-file-input" aria-describedby="inputGroupFileAddon01" name="imagesToUpload[]" id="imagesToUpload" multiple>
                <label class="custom-file-label" for="imagesToUpload">Choose file</label>
            </div>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

{include file="footer.tpl"}