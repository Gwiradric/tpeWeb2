{include file="header.tpl"}

<nav class="navbar navbar-expand-lg navbar-light bg-primary">
  <a class="navbar-brand" href='../'>
    <h1>Movies</h1>
  </a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="../">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="../all-movies/">All Movies <span class="sr-only">(current)</span></a>
                </li>
            </ul>
            
            {if $login}
                <span class="navbar-text">
                    Welcome {$username}
                </span>
                <a class="btn btn-primary" href="../logout" role="button">Logout</a>
                {else}
                    <div>
                        <a class="btn btn-primary" href="../login" role="button">Login</a>
                        <a class="btn btn-primary" href="../register" role="button">Register</a>
                    </div>
            {/if}
        </div>
</nav>

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
        <li>Year: {$movie['year']}</li>
        <li>Rating: {$movie['rating']} / 100</li>
      </ul>
      <h5>Description:</h5>
      <p>{$movie['description']}</p>

    </div>
  
  </div>

</div>


{include file="footer.tpl"}