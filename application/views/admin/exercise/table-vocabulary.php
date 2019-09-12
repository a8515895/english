<table class="table table-bordered table-primary">
    <?php foreach($vocabulary as $vol){ ?>                      
        <tr class="row-vocabulary" data-id="<?=$vol['id']?>" data-type="<?php if(!empty($vol['type'])) echo $vol['type'];?>" data-e="<?=$vol['e_name']?>" data-v="<?=$vol['v_name']?>" data-class="<?=$vol['class']?>">
            <td><?=$vol['e_name']?> <?php if(!empty($vol['type'])) echo '('.$vol['type'].')';?></td>
            <td><?=$vol['v_name']?></td>
        </tr>
    <?php } ?>
</table>
<script type="text/javascript">
    $('#search-vocabulary-input').on('keyup',function(){
        let val = $(this).val();
        $(".table-vocabulary").data('vocabulary',val);
        loadTableVocabularyInExcercise()
    })
    $("#select-class").on("change",function(){
        let val = $(this).val();
        $(".table-vocabulary").data('class',val);
        loadTableVocabularyInExcercise()
    })
    $("#select-type").on("change",function(){
        let val = $(this).val();
        $(".table-vocabulary").data('type',val);
        loadTableVocabularyInExcercise()
    })
    $("#select-category").on("change",function(){
        let val = $(this).val();
        $(".table-vocabulary").data('category',val);
        loadTableVocabularyInExcercise()
    })
    $(document).on("click",".row-vocabulary",function(){
        let data = {};        
        data = $(this).data();
        if(list_vocabulary[data.id] != null && list_vocabulary[data.id] != ''){
            
            $.toast({ 
                heading: 'Warning',
                icon: 'warning',
                text : 'Từ này đã có trong danh sách', 
                position : 'top-right'      
            })
            return false;
        } 
        list_vocabulary[data.id] = {id : data.id,class : data.class}
        let html =
        `
            <tr>
                <td>${data.e} ${data.type}</td>
                <td>${data.v}</td>
            </tr>
        `;
        $("#content-table-result").append(html);
    })
</script>