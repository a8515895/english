

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
                        <button type="button" class="btn btn-success" onclick="addExcercise()">Submit</button>
                    </div>
                    <div class="col" style="text-align : center">
                        <button type="button" data-toggle="modal"  data-target="#randomModal" class="btn btn-warning">Random</button>
                        <div class="modal fade" id="randomModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                            <div class="modal-dialog" role="document">
                                <div class="modal-content">
                                <div class="modal-header">
                                    <h5 class="modal-title" id="exampleModalLabel">Modal title</h5>
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <div class="modal-body">
                                    <input id="numberRandom" type="number"/>
                                </div>
                                <div class="modal-footer">
                                    <button type="button" class="btn btn-primary" onclick="randomExcercise()">Save changes</button>
                                </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col" style="text-align : right">
                        <button type="button" onclick="resetExcercise()" class="btn btn-danger pull-right">Reset</button>
                    </div>
                </div>
                <div class="row name-excercise">
                    <input class="form-control" id="name-excercise" placeholder="Tên bài kiểm tra" />
                </div>
                <div class="row content-table-result">
                    <table id="content-table-result" class="table table-bordered table-success">

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
        let list_vocabulary = [];        
        $(".table-vocabulary,.content-table-result").slimScroll({
            height : 'calc(100% - 100px)'
        });
        loadTableVocabularyInExcercise();
    })
    function randomExcercise(){
        list_vocabulary = [];
        let number = $("#numberRandom").val();
        if(number == '' || number == 0){
            return false;
        }
        $.get(url+'admin/exercise/index/randomExcercise',{count : number},function(kq){
            let res = $.parseJSON(kq);
            let html = '';
            res.forEach((data)=>{
                list_vocabulary[data.id] = {id : data.id,class : data.class}
                html +=
                `
                    <tr>
                        <td>${data.e_name} ${(data.type != null)?"("+data.type+")":""}</td>
                        <td>${data.v_name}</td>
                    </tr>
                `;
            })
            $("#content-table-result").html(html)
        })
    }
</script>