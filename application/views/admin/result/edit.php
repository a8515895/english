<div class="title">
    <div class="row">
        <div class="col title-left">
            <h3><?=$title?></h3>
        </div>
        <div class="col title-right">
            <div>
                <button  type="button" class="btn btn-success" data-toggle="modal" onclick="loadAjaxDefault('list')">Quay về</button>
            </div>
        </div>
    </div>
    <hr />
</div>
<div class="content">
    <table id="table-simple-<?=$href?>" class="table table-striped table-bordered">
        <thead>
        <tr>
            <th>Từ vựng</th>
            <th>Kết quả</th>
        </tr>
        </thead>
        <tbody>
            <?php foreach($data as $it){ ?>
                <tr>
                    <td><?=$it['vocabulary']?></td>
                    <td><?=$it['result']?></td>
                </tr>
            <?php } ?>
        </tbody>
    </table>
    <script type="text/javascript">        
        $(document).ready(function(){
            $('#table-simple-<?=$href?>').dataTable({

            });
        });
    </script>
</div>
