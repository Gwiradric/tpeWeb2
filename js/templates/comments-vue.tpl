{literal}
<section class="mt-3" id="template-vue-comments" v-if="comments.length">
  <div class="row">
    <div class="col-md-8">
      <div class="clearfix">
        <h5 class="float-left mb-4">{{ subtitle }}</h5>
        <div class="btn-group float-right">
          <button
            type="button"
            class="btn btn-info dropdown-toggle"
            data-toggle="dropdown"
            aria-haspopup="true"
            aria-expanded="false"
          >
            Order by
          </button>
          <div class="dropdown-menu" id="order-button">
            <a class="dropdown-item" href="#">Top scores</a>
            <a class="dropdown-item" href="#">Worst scores</a>
            <a class="dropdown-item" href="#">Newest comment</a>
            <a class="dropdown-item" href="#">Older comment</a>
          </div>
        </div>
      </div>

      <ul class="list-group list-group-flush">
        <li class="list-group-item" v-for="comment in comments">
          {/literal} {if $isAdmin == '1'} {literal}
            <button
              type="button"
              class="close"
              id="remove-comment"
              aria-label="Close"
              :data-id_comment="comment.id_comment"
            >
              <span aria-hidden="true">&times;</span>
            </button>
          {/literal} {/if} {literal}

          <span
            ><b>{{ comment.user }}</b> gives <b>{{ comment.score }}</b> stars
            and says:</span
          >
          <br />
          <p>{{ comment.comment }}</p>
        </li>
      </ul>
    </div>

    <div class="col-md-4">
      <h3>User score:</h3>

      <div v-if="average > 2.5">
        <span class="green float-left">{{ average }}</span>
        <div>
          Generally favorable reviews based on <b>{{ size }} critics</b>
        </div>
      </div>

      <div v-else>
        <span class="red float-left">{{ average }}</span>
        <div>
          Generally unfavorable reviews based on <b>{{ size }} critics</b>
        </div>
      </div>
    </div>
  </div>
</section>
{/literal}
