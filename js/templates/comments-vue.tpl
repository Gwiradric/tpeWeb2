{literal}
<section class="mt-5" id="template-vue-comments" v-if="comments.length">
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
            <button class="dropdown-item" type="button">Top scores</button>
            <button class="dropdown-item" type="button">Worst scores</button>
            <button class="dropdown-item" type="button">Newest comments</button>
            <button class="dropdown-item" type="button">Older comments</button>
          </div>
        </div>
      </div>

      <ul class="list-group list-group-flush">
        <li class="list-group-item" v-for="comment in comments">

          <div class="clearfix">
            <span class="float-left"
              ><b>{{ comment.user }}</b> gives <b>{{ comment.score }}</b> stars
              and says:</span
            >
            <span class="text-secondary float-right">{{ comment.date }}</span>
          </div>
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
