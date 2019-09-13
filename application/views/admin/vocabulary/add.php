
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
    <form autocomplete="off" method="post" data-url="admin/vocabulary/index/add" action="javascript:void(0)" onsubmit="postAjax(this)">
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Vocabulary</label>
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
            <label class="col-sm-4 col-form-label">Spell</label>
            <div class="col-sm-4">
                <input type="text" class="form-control" name="spell" placeholder="Spell">
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Category</label>
            <div class="col-sm-4">
                <select class="custom-select custom-select-lg mb-3" name="category">
                    <?php foreach($categorys as $cate){ ?>
                        <option value="<?=$cate['id']?>"><?=$cate['e_name']?></option>
                    <?php } ?>
                </select>            
            </div>
        </div>
        <div class="form-group row">
            <label class="col-sm-4 col-form-label">Type</label>
            <div class="col-sm-4">
                <select class="custom-select custom-select-lg mb-3" name="type">
                    <option value="n">n</option>
                    <option value="v">v</option>
                    <option value="adj">adj</option>
                    <option value="adv">adv</option>
                    <option value="other">other</option>
                </select>
            </div>
        </div>
        <div class="form-group row">
            <label for="inputPassword3" class="col-sm-4 col-form-label"></label>
            <div class="col-sm-4">
                <button class="btn btn-success" type="submit">Save Vocabulary</button>
            </div>
        </div>
    </form>
</div>
