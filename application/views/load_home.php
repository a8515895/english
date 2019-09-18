<!DOCTYPE html>
<html lang="vi">
<head>
    <?php $this->load->view('head'); ?>
</head>
<body>
    <?php $this->load->view('header'); ?>
    <section class="body-section">
        <div class="row">
            <div class="col">
                <a href="<?=base_url("exercise")?>">
                    <div class="box">
                        <div class="box-img">
                            <img src="<?=base_url("public/img/bg-exercise.png")?>" />
                        </div>
                        <div class="box-title">
                            <span>Bài tập</span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col">
                <a href="<?=base_url("lession")?>">
                    <div class="box">
                        <div class="box-img">
                            <img src="<?=base_url("public/img/bg-lession.png")?>" />
                        </div>
                        <div class="box-title">
                            <span>Bài học</span>
                        </div>
                    </div>
                </a>
            </div>
            <div class="col">
                <a href="<?=base_url("admin")?>">
                    <div class="box">
                        <div class="box-img">
                            <img src="<?=base_url("public/img/bg-admin.png")?>" />
                        </div>
                        <div class="box-title">
                            <span>Vào trang quản trị</span>
                        </div>
                    </div>
                </a>
            </div>
        </div>
    </section>
</body>
</html>
<?php $this->load->view('script'); ?>