{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3">
    <div class="row">

      <div class="col-md-3">
        <figure class="figure">
          <img src="{$link}{$images[0]['path']}" class="figure-img img-fluid rounded" alt="movie logo">
          <figcaption class="figure-caption text-right">{$movie['name']} logo.</figcaption>
        </figure>
      </div>

      <div class="col-md-7">
        <h1>{$movie['name']}</h1>

        <ul>
          <li>Genre: {$genre}</li>
          <li>Year: {$movie['year']}</li>
          <li>Rating: {$movie['rating']} / 100</li>
        </ul>
        <h5>Description:</h5>
        <p>{$movie['description']}</p>

      </div>
    </div>

    <h5>Images</h5>
    {foreach from=$images item=image key=key}
      <div class="images">
        <img src="{$link}{$image['path']}" class="img-thumbnail" alt="...">
        {if $isAdmin}
          <a href='{$link}remove-image/{$image['path']}'>Remove</a>
        {/if}
      </div>
    {/foreach}

</div>



{include file="footer.tpl"}