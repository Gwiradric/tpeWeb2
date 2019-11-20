{literal}
<section class="mt-3" id="template-vue-comments" v-if="comments.length">

    <h5>{{ subtitle }}</h5>

    <div class="row">
        <div class="col-md-8">
            <ul class="list-group list-group-flush">
                <li class="list-group-item" v-for="comment in comments">
                    <span><b>{{ comment.user}}</b> gives <b>{{comment.score}}</b> stars and says:</span>
                    <br><p>{{ comment.comment }}</p>
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

            <div v-if="average > 2.5">
                <span class="green float-left" >{{ average }}</span>
                <div>Generally favorable reviews based on <b>{{ size }} critics</b></div>
            </div>

            <div v-else>
                <span class="red float-left" >{{ average }}</span>
                <div>Generally unfavorable reviews based on <b>{{ size }} critics</b></div>
            </div>


        </div>
    </div>

</section>
{/literal}
