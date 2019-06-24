<div class="title">
    <div class="row">
        <div class="col title-left">
            <h3><?=$title?></h3>
        </div>
        <div class="col title-right">
            <a href="#" class="btn btn-success">Thêm <?=$title?></a>
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
