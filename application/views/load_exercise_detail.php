<!DOCTYPE html>
<html lang="vi">
<head>
    <?php $this->load->view('head'); ?>
</head>
<body data-exercise="<?=$exercise?>">
    <?php $this->load->view('header'); ?>
    <section class="container body-section">
        <h3>Bài <?=$name?></h3>
        <hr/>
        <div class="test-container">
            <?php foreach($test as $key=>$t){ ?>                
                <div data-stt="<?=$key?>" data-id="<?=$t['id']?>" data-last="<?=count($test)-1?>" data-e="<?=$t['e_name']?>" data-v="<?=$t['v_name']?>" data-type="<?php if(!empty($t['type'])) echo $t['type'];?>" data-class="<?php if(!empty($t['type'])) echo 'vocabulary'; else echo 'pharse' ?>" class="row test-content <?php if($key == 0) echo "active"; ?>">
                    <div class="col">
                        <h4><?=$t['v_name']?> <?php if(!empty($t['type'])) echo '('.$t['type'].')';?></h4>
                    </div>
                    <div class="col">
                        <p><input name="input-<?=$t['id']?>-<?php if(!empty($t['type'])) echo 'vocabulary'; else echo 'pharse' ?>" class="form-control"></p>
                        <p><button onclick="nextExcercise(this)" type="button" class="btn btn-primary">Tiếp tục</button></p>
                    </div>
                </div>
            <?php } ?>
        </div>
        <div class="test-result">
            <div style="" class="result"></div>
        </div>
        <div class="test-button row">
            <div class="col">
                <a href="<?=base_url("exercise")?>" class="btn btn-primary">Quay về</a>
            </div>
        </div>
    </section>
</body>
</html>
<?php $this->load->view('script'); ?>
<script>
    let result = {'true' : 0,'false' : 0};
    function nextExcercise(it){
        $('.test-content').removeClass("active");
        let answer = $(it).parents('.test-content').find('input').val();
        let content = $(it).parents('.test-content')
        let last = $(content).data('last');
        let stt = $(content).data('stt');
        let e = $(content).data('e');
        if(e == answer){
            $(content).find('input').addClass('is-valid'); 
            result['true']++;
        }
        else{
            $(content).find('input').addClass('is-invalid');
            result['false']++ ;     
        }   
        if(stt != last){
            stt += 1;
            $(`.test-content[data-stt=${stt}]`).addClass("active");
        }else{
            let html = 
            `
                <span style="color : red">${result['true']}</span> / <span style="color : green">${last+1}</span>
                <span>(Point: ${Math.round(result['true']/(last+1) *100) /100})</span>
            `;
            $(`.test-content`).addClass("active");
            $(".test-result .result").html(html);
            $(".test-container button").hide();       
            saveResultTest({'true' : result['true'],'false' : result['false'],point : Math.round(result['true']/(last+1) *100) /100})
        }
    }
    function saveResultTest(data = {}){        
        let id,table;
        let logs= {};
        logs['true'] = {};
        logs['false'] = {};
        let exercise = $("body").data("exercise");
        $(".test-container input").each(function(k,e){            
            id = $(e).parents(".test-content").data("id");
            table = $(e).parents(".test-content").data("class");
            logs[id] = {};
            logs[id]['class'] = table;
            if($(e).hasClass('is-valid')){
                logs[id]['result'] = true;
            }else{
                logs[id]['result'] = false;
            }
        })
        $.post(url+"home/saveLog",{logs : logs,exercise : exercise,data : data},function(kq){
            
        })
    }
</script>