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

</script>