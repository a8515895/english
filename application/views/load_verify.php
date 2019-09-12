<!DOCTYPE html>
<html lang="vi">
<head>
    <?php $this->load->view('head'); ?>
</head>
<style>
    .body-section{
        background: #f7762b;
        height: 100%;
    }
    .verify-container{
        height: 200px;
        width: 250px;
        background: #fff;
        border-radius : 8px;
        margin : 90px auto;
        padding: 10px;
    }
</style>
<body>
    <section class="body-section">
        <div class="verify-container">
            <form autocomplete="off" method="post" data-url="verify/login" action="javascript:void(0)" onsubmit="postAjax(this)">
                <div class="form-group">
                    <label>Username</label>
                    <input class="form-control" name="username">
                </div>
                <div class="form-group">
                    <label>Password</label>
                    <input type="password" class="form-control" name="password">
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Đăng nhập</button>
                </div>
            </form>
        </div>
    </section>
</body>
</html>
<?php $this->load->view('script'); ?>