<!DOCTYPE html>
<html lang="vi">
<head>
    <?php $this->load->view('head'); ?>
</head>
<body data-lession="<?=$lession?>">
    <?php $this->load->view('header'); ?>
    <section class="container body-section">
        <h3>Bài <?=$name?></h3>
        <hr/>
        <div class="row test-container">
            <div class="col">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th style="cursor : pointer" data-show="1" onclick="toggleHide(this,'e')">Hide</th>
                            <th style="cursor : pointer" data-show="1" onclick="toggleHide(this,'v')">Hide</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($lessions as $key=>$t){ ?>                
                            <tr>
                                <td class="col-e-name">
                                    <?=$t['e_name']?> <?php if(!empty($vol['type'])) echo '('.$vol['type'].')';?>
                                    <?=$this->myfunction->speakEnglish($t['e_name'])?>
                                </td>
                                <td class="col-v-name"><?=$t['v_name']?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
        <div class="row test-container">
            <div class="col">
                <table class="table table-bordered table-warning">
                    <thead>
                        <tr>
                            <th>Bài tập</th>
                            <th>Số câu</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach($test as $key=>$t){ ?>                
                            <tr>
                                <td>
                                    <a href="<?=base_url("exercise-detail/".$t['id'])?>" target="_blank"><?=$t['name']?></a>
                                </td>
                                <td><?=$t['count']?></td>
                            </tr>
                        <?php } ?>
                    </tbody>
                </table>
            </div>
        </div>
    </section>
</body>
</html>
<?php $this->load->view('script'); ?>
<script type="text/javascript">
    function toggleHide(it,col){
        let show = $(it).data("show");
        console.log(show);
        if(show == 1){
            $(it).html("Show");
            $(it).data("show",0);
            $(`.col-${col}-name`).css("background","#212529")
        }else{
            $(it).html("Hide");
            $(it).data("show",1);
            $(`.col-${col}-name`).css("background","#fff")
        }
    }
</script>