<nav class="navbar navbar-default bg-color">
    <div class="container-fluid">
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a title="Game Full Crack link torrent chỉ duy nhất 1 link" class="navbar-brand b" href="<?=base_url()?>" style="color : #fff;padding : 5px;width : 100px"><img title="Game Link Torrent Full Crack" src="<?=base_url("public/img/logo.png")?>" alt="Game Full Crack link torrent chỉ duy nhất 1 link"></a>
        </div>
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav">
            <li class="dropdown">
                <a title="Thể loại game" href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true" aria-expanded="false">Thể loại game <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <?php foreach($listGenre as $it){ ?>
                        <li><a title="<?=$it['name']?>" href="<?=base_url("genre/".$it['none_name'].".html")?>"><?=$it['name']?></a></li>
                    <?php } ?>
                </ul>
            </li>
        </ul>
        <ul class="nav navbar-nav navbar-right" style="margin-top : 5px">
            <li style="position : relative">
                <input id="searchGame" type="text" class="form-control" placeholder="Search">
                <div id="containSearchGame" style="width : 196px;min-heigh : 50px;max-height : 300px;background : #fff;position : absolute;top : 39px;left : 0;overflow : auto;box-shadow: 1px 9px 3px 4px #ccc;display : none">
                    <div class="wh100 text-center" id="loadingSearchGame" style="padding : 10px">
                        <i class="fas fa-circle-notch fa-spin fa-2x"></i>
                    </div>
                    <div id="listSearchGame" style="display : none">

                    </div>
                </div>
            </li>
        </ul>
        </div><!-- /.navbar-collapse -->
    </div><!-- /.container-fluid -->
</nav>