{literal}
<section class="mt-3" id="template-vue-comments" v-if="comments.length">

    <h5>{{ subtitle }}</h5>

    <div class="row">
        <div class="col-md-8">
            <ul class="list-group list-group-flush">
                <li class="list-group-item" v-for="comment in comments">
                    <span><b>{{ comment.user}}</b> gives <b>{{comment.score}}</b> stars and says: <br>{{ comment.comment }}
                        {/literal}
                        {if $isAdmin == '1'}
                            {literal}
                                <br><button type="button" class="btn btn-danger" id="remove-comment" :data-id_comment="comment.id_comment">Remove comment</button>
                            {/literal}
                        {/if}
                        {literal}
                </li> 
            </ul>
        </div>
        
        <div class="col-md-4">
            <h3>User score:</h3>
            <span class="green" v-if="average > 2.5">{{ average }}</span>
            <span class="red" v-else>{{ average }}</span>
        </div>
    </div>

</section>
{/literal}
