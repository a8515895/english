$(document).ready(function(){
    $('[data-toggle="tooltip"]').tooltip();
})
$(document).on('click','.body-left li[data-href]',function () {
    let href = $(this).data('href');
    $(".body-left ul li").removeClass('active');
    $(this).addClass('active');
    loadAjax('list',href)
})
function loadAjax(action,href,id="") {
    $("#loading").show();
    $.ajax({
        method : 'get',
        type : 'get',
        url : url+'admin/ajax/'+href,
        data : {action : action,id : id},
        success : function (kq) {
            $('.body-right .section-content').html(kq);
            rewrite_url = url+"admin/"+href+"?action="+action;
            if(id != "") rewrite_url += `&id=${id}`;
            window.history.pushState(null, null,rewrite_url);
        }
    }).done(function () {
        $("#loading").hide();
    });
}
function loadAjaxDefault(action,id="") {
    href = $('.body-left li.active').data('href')
    $("#loading").show();
    $.ajax({
        method : 'get',
        type : 'get',
        url : url+'admin/ajax/'+href,
        data : {action : action,id : id},
        success : function (kq) {
            $('.body-right .section-content').html(kq);
            rewrite_url = url+"admin/"+href+"?action="+action;
            if(id != "") rewrite_url += `&id=${id}`;
            window.history.pushState(null, null,rewrite_url);
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
                console.log(res);
                if(res.redirect != null && res.redirect != ""){
                    window.location.href = url+res.redirect;
                }
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
function confirmDelete(it){
    let href = $(it).data('href');
    if (confirm("Are you sure delete?")) {
        $.get(href,{},function(){
            loadAjaxDefault('list')
        })
        
    }
    return false;
}
function loadTableVocabularyInExcercise(data = {}){       
    data['vocabulary'] = $(".table-vocabulary").data('vocabulary');
    data['class'] = $(".table-vocabulary").data('class');
    data['type'] = $(".table-vocabulary").data('type');
    data['category'] = $(".table-vocabulary").data('category');
    $('.table-vocabulary').load(url+'admin/ajax/exercise/loadtable',{filter : data})
}
function loadTableVocabularyInLession(data = {}){       
    data['vocabulary'] = $(".table-vocabulary").data('vocabulary');
    data['class'] = $(".table-vocabulary").data('class');
    data['type'] = $(".table-vocabulary").data('type');
    data['category'] = $(".table-vocabulary").data('category');
    $('.table-vocabulary').load(url+'admin/ajax/exercise/loadtable',{filter : data})
}
function resetExcercise(){
    list_vocabulary = [];
    $("#content-table-result").html('');
    $("#name-excercise").val('');
}
function resetLession(){
    list_vocabulary = [];
    $("#content-table-result").html('');
    $("#name-lession").val('');
}
function speakEnglish(it){
    let audio = $(it).find("audio");
    audio[0].play();
}