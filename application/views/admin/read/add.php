
<div class="title">
    <div class="row">
        <div class="col title-left">
            <h3><?=$title?></h3>
        </div>
        <div class="col title-right">
            <div>
                <button  type="button" class="btn btn-success" data-toggle="modal" onclick="loadAjaxDefault('list')">Danh sách <?=$title?></button>
            </div>
        </div>
    </div>
    <hr />
</div>
<div style="height : 500px" class="content">
    <form style="height : 500px" autocomplete="off" method="post" data-url="admin/read/index/add" action="javascript:void(0)" onsubmit="postAjax(this)">
        <textarea rows="20" name="read" id="editor">
        </textarea>
    </form>
</div>
<script>
    ClassicEditor.create( document.querySelector( '#editor' ) )
    .then( editor => {
        console.log( editor );
    } )
    .catch( error => {
        console.error( error );
    } );
</script>
