<nav class="navbar navbar-expand-lg navbar-default bg-color">
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item active">
                <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<?=base_url("exercise")?>">Bài tập</a>
            </li>
            <li class="nav-item">
                <a class="nav-link" href="<?=base_url("admin")?>">Vào trang quản trị</a>
            </li>
            <!-- <li class="nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Bài tập
                </a>
                <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                    <a class="dropdown-item" href="#">Action</a>
                    <a class="dropdown-item" href="#">Another action</a>
                    <div class="dropdown-divider"></div>
                    <a class="dropdown-item" href="#">Something else here</a>
                </div>
            </li> -->
        </ul>
        <div class="navbar-text dropdown">            
            <div style="display:block" href="javascript:void(0)" class="avatar">
                <img src="<?=base_url("public/img/avatar/".$avatar)?>">
            </div>
        </div>
    </div>
</nav>