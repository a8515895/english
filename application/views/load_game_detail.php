<!DOCTYPE html>
<html lang="vi">
<head>
    <?php $this->load->view('head'); ?>
</head>
<body>
    <noscript><iframe src="https://www.googletagmanager.com/ns.html?id=GTM-NGMHGDJ"
    height="0" width="0" style="display:none;visibility:hidden"></iframe></noscript>
    <header>
        <?php $this->load->view('header'); ?>
    </header>
    <section class="body-section">
        <div class="container h100">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center b" style="color : #692180;font-size : 18px"><a title='<?=$game->name?>' href="<?=base_url("game/".$game->none_name.".html")?>"><?=ucfirst($game->name)?></a> <div class="fb-like" data-href="<?=base_url("game/".$game->none_name.".html")?>" data-layout="button_count" data-action="like" data-size="small" data-show-faces="true" data-share="true"></div></h1>
                    <div style="height : 225px;width : 175px;overflow : hidden;margin : auto">
                        <a title="<?=$game->name?>" href="<?=base_url("game/".$game->none_name.".html")?>">
                            <img title="<?=$game->name?>" src="<?=base_url("public/img/".$game->avatar)?>" alt="<?=$game->name?>" class="img-thumbnail">
                        </a>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h2 style="font-size : 18px">
                        Game <?=$game->name?> Full Crack Link Torrent chỉ duy nhất 1 link
                    </h2>
                    <p>
                        Game <?=$game->name?> fullcrack link torrent <?=$game->description?>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <p>
                        <span class="b">Thể Loại: </span>
                        <span><?php 
                            $title_genre = '';
                            foreach($genre as $g){
                                $title_genre .= "<a title='$g[name]' href='".base_url("genre/".$g['none_name'].".html")."'>".$g['name']."</a>, ";
                            }
                            $title_genre = rtrim($title_genre,', ');
                            echo $title_genre;
                        ?></span>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <p>
                        <span class="b">Ngày sản xuất: </span>
                        <span><?=date("d/m/Y",strtotime($game->release_at))?></span>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <p>
                        <span class="b">Dung lượng: </span>
                        <span><?=$game->size?></span>
                    </p>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <h5 class="b">CẤU HÌNH</h5>
                    <ul>
                        <li><b>Win</b>: <?=$game->win?></li>
                        <li><b>CPU</b>: <?=$game->cpu?></li>
                        <li><b>Ram</b>: <?=$game->ram?></li>
                        <li><b>VGA</b>: <?=$game->vga?></li>
                        <li><b>HDD</b>: <?=$game->hdd?></li>
                    </ul>
                </div>
            </div>
            <div class="row">
                <div class="col-md-12">
                    <a title='<?=$game->name?>' class="btn btn-success" href="<?=base_url("link-torrent.html?token=").urlencode($this->myfunction->hash($game->link))?>" target="_blank" download>Link Torrent</a>                    
                </div>
            </div>
        </div>
    </section>
</body>
</html>
<?php $this->load->view('script'); ?>