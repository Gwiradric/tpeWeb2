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
            <h6>User score:</h6>
            {{ average }}
            <h1><span class="blue">3</span></h1>
        </div>
    </div>



    

</section>
{/literal}
