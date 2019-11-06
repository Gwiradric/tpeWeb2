{include file="header.tpl"}

{include file="navbar.tpl"}

<div class="container mt-3">

    <h2>{$subtitle}</h2>

    <div class="table-responsive">
                <table class="table table-striped">
                    <thead>
                        <tr>
                            <th scope="col">Name</th>
                            <th scope="col">Admin?</th>
                            <th scope="col">Options</th>
                        </tr>
                    </thead>
                    <tbody>
                        {foreach from=$users item=user}
                        <tr>
                            <th>{$user["username"]}</th>
                                {if $user["admin"] eq 1}
                                    <td>TRUE</td>
                                    <td><a href={$link}"">Remove admin</a></td>
                                {else}
                                    <td>FALSE</td>
                                    <td><a href={$link}"">Add admin</a></td>
                                {/if}
                            <td> 
                            </td> 
                        </tr>
                        {/foreach}
                    </tbody>
                </table>
            </div>

</div>

{include file="footer.tpl"}