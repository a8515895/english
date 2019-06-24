<!DOCTYPE html>
<html lang="vi">
<head>
    <?php $this->load->view('head'); ?>
</head>
<body>
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NGMHGDJ"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <section class="body-section">
        <div class="container h100">
            <div class="row p10">
                <?php if(empty($listGame)){ ?>
                    <div class='wh100 text-center' style='color : #ccc'>
                        <i class='fas fa-inbox fa-6x'></i>
                        <h3>KHÔNG CÓ DỮ LIỆU</h3>
                    </div>
                <?php }else{ ?>
                <?php foreach($listGame as $key=>$game){?>
                        <div class="col-md-4 mt10">
                            <div class="box-img">
                                <div class="div-contain-img">
                                    <a title="<?=$game['name']?>" href="<?=base_url("game/".$game['none_name'].".html")?>">
                                        <img title="<?=$game['name']?>" src="<?=base_url("public/img/".$game['avatar'])?>" alt="<?=$game['name']?>" class="img-thumbnail">
                                    </a>
                                </div>
                                <div>
                                    <h3 data-toggle="tooltip" data-placement="top" title="<?=$game['name']?>"><a title="<?=$game->name?>" href="<?=base_url("game/".$game['none_name'])?>"><?=$this->myfunction->limitChar($game['name'])?></a></h3>
                                </div>
                            </div>
                        </div>
                <?php }} ?>
            </div>
        </div>
    </section>
</body>
</html>
<?php $this->load->view('script'); ?>