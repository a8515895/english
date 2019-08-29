<div class="title">
    <div class="row">
        <div class="col title-left">
            <h3><?=$title?></h3>
        </div>
        <div class="col title-right">
            <div>
                <button  type="button" class="btn btn-success" data-toggle="modal" data-target="#exampleModal">Thêm <?=$title?></button>
                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title" id="exampleModalLabel">Chọn file Excel thêm từ vựng</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body">
                                <form action="javascript:void(0)" class="form" enctype="multipart/form-data" method="post" id="formExcel" onsubmit="uploadExcel(this)">
                                    <input style="display: block" type="file" name="fileExcel">
                                    <button class="btn btn-primary" type="submit">Upload file</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <hr />
</div>
<div class="content">
    <table id="table-simple" class="table table-striped table-bordered">
        <thead>
        <tr>
            <?php foreach($header as $head){ ?>
                <th><?=$head?></th>
            <?php } ?>
        </tr>
        </thead>
    </table>
    <script type="text/javascript">
        $(document).ready(function(){
            $('#table-simple').dataTable( {
                processing: true,
                "serverSide": true,
                "ajax": {
                    "type": "GET",
                    'url': url+'admin/table/index',
                    'data' : {href : '<?=$href?>'}
                }
            });
        });
    </script>
</div>
