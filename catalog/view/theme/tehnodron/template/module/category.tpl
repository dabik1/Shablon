<div class="list-group">
  <h3 class="module-title">Категорії</h3>
  <?php foreach ($categories as $category) { ?>
  <a href="<?php echo $category['href']; ?>" class="list-group-item<?php echo ($category['category_id'] == $category_id) ? ' active' : ''; ?>">
    <?php echo $category['name']; ?>
    <?php if ($category['children']) { ?>
    <span class="badge"><?php echo count($category['children']); ?></span>
    <?php } ?>
  </a>
  <?php if ($category['children']) { ?>
  <?php foreach ($category['children'] as $child) { ?>
  <a href="<?php echo $child['href']; ?>" class="list-group-item<?php echo ($child['category_id'] == $category_id) ? ' active' : ''; ?>" style="padding-left: 30px;">
    &nbsp;&nbsp;&nbsp;- <?php echo $child['name']; ?>
  </a>
  <?php } ?>
  <?php } ?>
  <?php } ?>
</div>
