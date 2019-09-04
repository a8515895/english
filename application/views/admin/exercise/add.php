
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
        <div class="col-md exercise-result"></div>
        <div class="col-md exercise-vocabulary">
            <div class="search-vocabulary">
                <div class="input-group mb-3">
                    <div class="input-group-prepend">
                        <span class="input-group-text" id="basic-addon1"><i class="fas fa-search"></i></span>
                    </div>
                    <input type="text" class="form-control" placeholder="Username" aria-label="Username" aria-describedby="basic-addon1">
                </div>
            </div>
            <div class="filter-vocabulary">
                <div class="row">
                    <div class="col">
                        <select id="select-category">
                            <option value="">-- Mời chọn thể loại</option>
                        </select>
                    </div>
                    <div class="col">
                        <select id="select-type">
                            <option value="">-- Mời chọn loại từ</option>
                            <option value="n">n</option>
                            <option value="v">v</option>
                            <option value="adj">adj</option>
                            <option value="adv">adv</option>
                        </select>
                    </div>
                    <div class="col">
                        <select id="select-class">
                            <option value="">-- Mời chọn dạng từ</option>
                            <option value="vocabulary">Vocabulary</option>
                            <option value="pharse">Pharse</option>
                        </select>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- <form autocomplete="off" method="post" data-url="admin/exercise/index/add" action="javascript:void(0)" onsubmit="postAjax(this)">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Phrase</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="e_name" placeholder="Vocabulary">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Tiếng Viết</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="v_name" placeholder="Tiếng Việt">
            </div>
        </div>
        <div class="form-group row">
            <label for="inputPassword3" class="col-sm-4 col-form-label"></label>
            <div class="col-sm-4">
                <button class="btn btn-success" type="submit">Save Phrase</button>
            </div>
        </div>
    </form> -->
</div>
<script>
    $("#select-category").select2({
        
    });
</script>
