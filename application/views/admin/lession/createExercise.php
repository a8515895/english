

<div class="title">
    <div class="row">
        <div class="col title-left">
            <h3><?=$title?></h3>
        </div>
    </div>
    <hr />
</div>
<div class="content">
    <div class="row">
        <div class="col-4 text-right"><h4>Số lượng bài</h4></div>
        <div class="col-4"><input id="number-exercise" class="form-control" name="number" value="1" /></div>
    </div>
    <div class="row">
        <div class="col-4"></div>
        <div class="col-4"><button id="createExerciseInLession" type="button" class="btn btn-primary" >Tạo bài tập</button></div>
    </div>
</div>
<script type="text/javascript">
    $("#createExerciseInLession").on("click",function(){
        let  urlParams = new URLSearchParams(window.location.search);
        let id = urlParams.get('id');
        let val = $("#number-exercise").val();
        $.post(url+"admin/lession/createExercise",{val : val,id : id},function(kq){
            let res = $.parseJSON(kq);
            if(res.err == 0){
                window.location.href = url+"admin/exercise?action=list";
            }
        })
    })
</script>
