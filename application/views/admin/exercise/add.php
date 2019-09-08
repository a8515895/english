

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
<div class="content">
    <div class="row exercise-content">
        <div class="col-md exercise-result">
            <div class="table-result">
                <div class="row button-result">
                    <div class="col">
                        <button class="btn btn-success">Submit</button>
                    </div>
                    <div class="col" style="text-align : right">
                        <button class="btn btn-danger pull-right">Reset</button>
                    </div>
                </div>
                <div class="content-table-result">
                    <table class="table table-bordered table-success">
                        <tr>
                            <td>test</td>
                            <td>test</td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
        <div class="col-md exercise-vocabulary">
            <div class="search-vocabulary">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
                    </div>
                    <input id="search-vocabulary-input" type="text" class="form-control" placeholder="Vocabulary or Pharse" aria-label="Vocabulary or Pharse" aria-describedby="basic-addon1">
                </div>
            </div>
            <div class="filter-vocabulary">
                <div class="row">
                    <div class="col">
                        <select id="select-category" class="form-control">
                            <option value="">-- Mời chọn thể loại</option>
                            <?php foreach($categorys as $category){ ?>
                                <option value="<?=$category['id']?>"><?=$category['e_name']?></option>
                            <?php } ?>
                        </select>
                    </div>
                    <div class="col">
                        <select id="select-type" class="form-control">
                            <option value="">-- Mời chọn loại từ</option>
                            <option value="n">n</option>
                            <option value="v">v</option>
                            <option value="adj">adj</option>
                            <option value="adv">adv</option>
                        </select>
                    </div>
                    <div class="col">
                        <select id="select-class" class="form-control">
                            <option value="">-- Mời chọn dạng từ</option>
                            <option value="vocabulary">Vocabulary</option>
                            <option value="pharse">Pharse</option>
                        </select>
                    </div>
                </div>
            </div>
            <div class="table-vocabulary" data-vocabulary="" data-class="" data-type="" data-category="">

            </div>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        $(".table-vocabulary,.content-table-result").slimScroll({
            height : 'calc(100% - 100px)'
        });
        loadTableVocabularyInExcercise();
    })
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
        console.log($(this).data())
    })
    function loadTableVocabularyInExcercise(data = {}){       
        data['vocabulary'] = $(".table-vocabulary").data('vocabulary');
        data['class'] = $(".table-vocabulary").data('class');
        data['type'] = $(".table-vocabulary").data('type');
        data['category'] = $(".table-vocabulary").data('category');
        $('.table-vocabulary').load(url+'admin/ajax/exercise/loadtable',{filter : data})
    }
</script>
