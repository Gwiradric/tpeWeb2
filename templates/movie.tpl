{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3" data-id_movie = "{$movie['id_movie']}" data-id_user = "{$id_user}">
    <div class="row">

      <div class="col-md-3">
        {if $isAdmin}
        <a href='{$link}remove-image/{$images[0]['path']}'>Remove logo</a>
        {/if}
        <figure class="figure">
          <img src="{$link}{$images[0]['path']}" class="figure-img img-fluid rounded" alt="movie logo">
          <figcaption class="figure-caption text-right">{$movie['name']} logo.</figcaption>
        </figure>
      </div>

      <div class="col-md-9">
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
      {if $key != 0}
      <div class="images mt-1">
          <img src="{$link}{$image['path']}" class="img-thumbnail" alt="...">
          {if $isAdmin}
            <a href='{$link}remove-image/{$image['path']}'>Remove</a>
          {/if}
      </div>
      {/if}
    {/foreach}

{include file="comments.tpl"}

{include file="footer.tpl"}