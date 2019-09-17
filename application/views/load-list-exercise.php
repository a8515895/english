<table class="table table-borderless table-dark">
    <thead>
        <tr>
            <th>Bài kiểm tra</th>
            <th>Số câu</th>
        </tr>
    </thead>
    <?php foreach($exercises as $exercises){ ?>
    <tr>
        <td><a href="<?=base_url("exercise-detail/".$exercises['id'])?>"><?=$exercises['name']?></a></td>
        <td><?=$exercises['count']?></td>
    </tr>
    <?php } ?>
</table>