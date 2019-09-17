<!DOCTYPE html>
<html lang="vi">
<head>
    <?php $this->load->view('head'); ?>
</head>
<body>
    <?php $this->load->view('header'); ?>
    <section class="container body-section">      
        <h3>Danh sách bài tập</h3>
        <hr/>
        <div class="row">
            <div class="col-3">
                <select class="form-control" id="list-lession">
                    <option value="">-- Mời chọn bài học</option>
                    <?php foreach($lessions as $lession){ ?>
                        <option value="<?=$lession['id']?>"><?=$lession['name']?></option>
                    <?php } ?>
                </select>
            </div>
            <div class="col-3">
            <div class="form-check">
                <label class="form-check-label" for="onlyListen">
                    <input class="form-check-input" type="checkbox" name="onlyListen" id="onlyListen" value="onlyListen">
                    Chỉ có âm thanh
                </label>
            </div>
            </div>
        </div>
        <div class="row" id="table-lession-table">
            <table id="table-exercise-normal" class="table table-borderless table-dark">
                <thead>
                    <tr>
                        <th>Bài kiểm tra</th>
                        <th>Số câu</th>
                    </tr>
                </thead>
                <?php foreach($exercises as $exercises){ ?>
                <tr>
                    <td><a data-id="<?=$exercises['id']?>" class="exercise-detail-href" href="<?=base_url("exercise-detail/".$exercises['id'])?>"><?=$exercises['name']?></a></td>
                    <td><?=$exercises['count']?></td>
                </tr>
                <?php } ?>
            </table>
        </div>
    </section>
</body>
</html>
<?php $this->load->view('script'); ?>
<script type="text/javascript">
    $(document).ready(function(){
        $("#list-lession").change(function(){
            $.get(url+"home/load_list_exercise",{val : $(this).val()},function(kq){
                $("#table-lession-table").html(kq);
            })
        })
        $("#onlyListen").click(function(){
            let check = $(this)[0];
            $(".exercise-detail-href").each(function(e){
                let a = $(this)[0];
                let id = $(a).data("id");
                if($(check).prop("checked")){
                    $(a).attr("href",url+"exercise-detail/"+id+"?listen=true")
                }else{
                    $(a).attr("href",url+"exercise-detail/"+id)
                }
            })
        })
    })
</script>