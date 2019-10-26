{include file="header.tpl"}

<nav class="navbar navbar-expand-lg navbar-light bg-primary">
        <a class="navbar-brand" href='./'><h1>Movies</h1></a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarText"
            aria-controls="navbarText" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarText">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="./">Home <span class="sr-only">(current)</span></a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="all-movies/">All Movies</a>
                </li>
            </ul>
            
            <a class="btn btn-primary" href="register" role="button">Register</a>
        </div>
    </nav>

<div class="container mt-3">

    <h3>Login</h3>

    <form method="post" action=check-login>
        
        <div class="form-group">
            <input type="text" class="form-control" id="user" aria-describedby="user" placeholder="Username" name="username">
        </div>
        
        <div class="form-group">
            <input type="password" class="form-control" id="password" placeholder="Password" name="password">
        </div>

        <p class='text-danger'>{$message}</p>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
</div>

{include file="footer.tpl"}