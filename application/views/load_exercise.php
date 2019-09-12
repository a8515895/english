<!DOCTYPE html>
<html lang="vi">
<head>
    <?php $this->load->view('head'); ?>
</head>
<body>
    <?php $this->load->view('header'); ?>
    <section class="container body-section">
        <h3>Danh sách bài tập</h3>
        <hr/>
        <table class="table table-borderless table-dark">
            <thead>
                <tr>
                    <th>Bài kiểm tra</th>
                    <th>Số câu</th>
                </tr>
            </thead>
            <?php foreach($excercises as $excercises){ ?>
            <tr>
                <td><a href="<?=base_url("exercise-detail/".$excercises['id'])?>"><?=$excercises['name']?></a></td>
                <td><?=$excercises['count']?></td>
            </tr>
            <?php } ?>
        </table>
    </section>
</body>
</html>
<?php $this->load->view('script'); ?>