{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3">
  <div class="row">

    {if $movie['img'] != 0}
      <div class="col-md-2">
        <figure class="figure">
          <img src="../img/{$movie['img']}.jpg" class="figure-img img-fluid rounded" alt="movie logo">
          <figcaption class="figure-caption text-right">{$movie['name']} logo.</figcaption>
        </figure>
      </div>
    {/if}

    <div class="col-md-10">
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

</div>


{include file="footer.tpl"}