<!DOCTYPE html>
<html lang="vi">
<head>
    <?php $this->load->view('head'); ?>
</head>
<body>
    <?php $this->load->view('header'); ?>
    <section class="container body-section">
        <h3>Danh sách bài học</h3>
        <hr/>
        <table class="table table-borderless table-dark">
            <thead>
                <tr>
                    <th>Bài học</th>
                    <th>Số câu</th>
                </tr>
            </thead>
            <?php foreach($lessions as $lession){ ?>
            <tr>
                <td>
                    <a href="<?=base_url("lession-detail/".$lession['id'])?>"><?=$lession['name']?></a>
                </td>
                <td><?=$lession['count']?></td>
            </tr>
            <?php } ?>
        </table>
    </section>
</body>
</html>
<?php $this->load->view('script'); ?>