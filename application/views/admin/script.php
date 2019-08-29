
<script src="<?=base_url("public/js/popperjs.min.js")?>"></script>
<script src="<?=base_url("public/js/bootstrap.min.js")?>"></script>
<script src="<?=base_url("public/js/bootstrap.bundle.min.js")?>"></script>
<script src="<?=base_url("public/plugin/datatable/datatables.min.js")?>"></script>
<script src="<?=base_url("public/js/toast.min.js")?>"></script>
<script type="text/javascript">
    $(document).ready(function(){
        $('[data-toggle="tooltip"]').tooltip();
        $('.body-left li a').first().click();
    });
    $(document).on('click','.body-left a',function () {
        let href = $(this).data('href');
        loadAjax('list',href)
    })
    function loadAjax(action,href) {
        $("#loading").show();
        $.get({
            method : 'get',
            type : 'get',
            url : url+'admin/'+href,
            data : {action : action},
            success : function (kq) {
                $('.body-right .section-content').html(kq);
            }
        }).done(function () {
            $("#loading").hide();
        });
    }
    function uploadExcel(it) {
        let formData = new FormData($(it)[0]);
        $.ajax({
            url: url+'admin/vocabulary/index/postExcel',
            type: "POST",
            data: formData,
            processData: false,
            contentType: false,
            success: function (kq) {
                // if all is well
                // play the audio file
            }
        });
    }
</script>