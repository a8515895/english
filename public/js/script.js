$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
    $('.body-left li a').first().click();
});
$(document).on('click','.body-left li',function () {
    let href = $(this).data('href');
    $(".body-left ul li").removeClass('active');
    console.log($(this))
    $(this).addClass('active');
    loadAjax('list',href)
})
function loadAjax(action,href) {
    $("#loading").show();
    $.ajax({
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
function loadAjaxDefault(action) {
    href = $('.body-left li.active').data('href')
    $("#loading").show();
    $.ajax({
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
            let res = $.parseJSON(kq);
            if(res.err == 0){
                $.toast({ 
                    heading: 'Success',
                    icon: 'success',
                    text : res.msg, 
                    position : 'top-right'      
                })
                loadAjax('list',$('.body-left li.active').data('href'))
                $("#exampleModal").find('.close').click();
                $(".modal-backdrop").remove();
            }else{
                $.toast({ 
                    heading: 'Fail',
                    icon: 'error',
                    text : res.msg, 
                    position : 'top-right'      
                })
            }
        }
    });
}
function postAjax(it){
    let formData = new FormData($(it)[0]);
    let href = $(it).data('url')
    $.ajax({
        url: url+href,
        type: "POST",
        data: formData,
        processData: false,
        contentType: false,
        success: function (kq) {
            let res = $.parseJSON(kq);
            if(res.err == 0){
                $.toast({ 
                    heading: 'Success',
                    icon: 'success',
                    text : res.msg, 
                    position : 'top-right'      
                })
                loadAjax('list',$('.body-left li.active').data('href'))
                $("#exampleModal").find('.close').click();
                $(".modal-backdrop").remove();
            }else{
                $.toast({ 
                    heading: 'Fail',
                    icon: 'error',
                    text : res.msg, 
                    position : 'top-right'      
                })
            }
        }
    })
}