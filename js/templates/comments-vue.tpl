{literal}
<section class="mt-3" id="template-vue-comments">

    <h5>Comments</h5>

    <ul class="list-group list-group-flush">
       <li class="list-group-item" v-for="comment in comments">
           <span>{{ comment.comment }} - {{comment.score}}
       </li> 
    </ul>

</section>
{/literal}
