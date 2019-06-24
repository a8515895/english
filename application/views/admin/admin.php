<!DOCTYPE html>
<html lang="vi">
<head>
    <?php $this->load->view('admin/head'); ?>
</head>
<body>
<section class="admin-body-section">
    <div class="body-left">
        <ul>
            <li data-toggle="tooltip" title="Từ vựng" data-placement="right">
                <a data-href="vocabulary" href="javascript:void(0)">
                    <i class="fas fa-language fa-2x"></i>
                </a>
            </li>
            <li data-toggle="tooltip" title="Chủ Đề" data-placement="right">
                <a data-href="category" class="" href="javascript:void(0)">
                    <i class="fas fa-address-book fa-2x"></i>
                </a>
            </li>
        </ul>
    </div>
    <div class="body-right">
        <div id="loading">
            <i class="fas fa-spinner fa-spin fa-4x"></i>
        </div>
        <div class="section-content"></div>
    </div>
</section>
</body>
</html>
<?php $this->load->view('admin/script'); ?>