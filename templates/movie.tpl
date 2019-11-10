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

      
      <div class="col-md-2 images">
      <h5>Images</h5>
      {foreach from=$images item=image key=key}
          <img src="{$link}{$image['path']}" class="img-thumbnail" alt="...">
          {if $isAdmin}
            <a href='{$link}remove-image/{$image['path']}'>Remove</a>
          {/if}
      {/foreach}
    </div>
    </div>

    {* <div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
      <div class="carousel-inner">
        {foreach from=$images item=image key=key}
        {if $key != 0}
        <div class="carousel-item {if $key == 1}active{/if}">
          <img src="{$link}{$image['path']}" class="d-block w-100">
        </div>
        {/if}
        {/foreach}
        <a class="carousel-control-prev" href="#carouselExampleControls" role="button" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#carouselExampleControls" role="button" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <span class="sr-only">Next</span>
        </a>
      </div>
    </div> *}

</div>



{include file="footer.tpl"}