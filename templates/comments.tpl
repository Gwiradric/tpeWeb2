<section id="comments">
    <ul class="list-comments">
    </ul>
</section>

<h3>Insert your comment</h3>
<form id="form-comments" action="insert-comment" method="post">
    
    <div class="form-group">
        <label for="comment-text">Comment</label>
        <textarea class="form-control" id="comment-text" name="comment" rows="3"></textarea>
    </div>

    <div class="form-group">
        <label for="score-select">Score</label>
        <select class="form-control" id="score-select" name="score">
            <option>1</option>
            <option>2</option>
            <option>3</option>
            <option>4</option>
            <option>5</option>
        </select>
    </div>
</form>

<button type="submit" class="btn btn-primary">Submit</button>

</div>
