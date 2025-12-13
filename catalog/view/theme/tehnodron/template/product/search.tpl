<?php echo $header; ?>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <div class="row">
    <?php echo $column_left; ?>

    <?php if ($column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ($column_left || $column_right) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

    <div id="content" class="<?php echo $class; ?>">
      <?php echo $content_top; ?>

      <h1><?php echo $heading_title; ?></h1>

      <div class="search-form">
        <label class="control-label" for="input-search">Критерії пошуку</label>
        <div class="row">
          <div class="col-sm-4">
            <input type="text" name="search" value="<?php echo $search; ?>" placeholder="Пошук" id="input-search" class="form-control" />
          </div>
          <div class="col-sm-3">
            <select name="category_id" class="form-control">
              <option value="0">Всі категорії</option>
              <?php foreach ($categories as $category_1) { ?>
              <?php if ($category_1['category_id'] == $category_id) { ?>
              <option value="<?php echo $category_1['category_id']; ?>" selected="selected"><?php echo $category_1['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $category_1['category_id']; ?>"><?php echo $category_1['name']; ?></option>
              <?php } ?>
              <?php foreach ($category_1['children'] as $category_2) { ?>
              <?php if ($category_2['category_id'] == $category_id) { ?>
              <option value="<?php echo $category_2['category_id']; ?>" selected="selected">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $category_2['category_id']; ?>">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<?php echo $category_2['name']; ?></option>
              <?php } ?>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="col-sm-3">
            <label class="checkbox-inline">
              <?php if ($sub_category) { ?>
              <input type="checkbox" name="sub_category" value="1" checked="checked" />
              <?php } else { ?>
              <input type="checkbox" name="sub_category" value="1" />
              <?php } ?>
              Шукати в підкатегоріях
            </label>
          </div>
          <div class="col-sm-2">
            <button type="button" id="button-search" class="btn btn-primary btn-block">Пошук</button>
          </div>
        </div>
      </div>

      <?php if ($products) { ?>
      <div class="product-filter">
        <div class="row">
          <div class="col-sm-4">
            <div class="btn-group btn-group-sm">
              <button type="button" id="list-view" class="btn btn-default" data-toggle="tooltip" title="Список"><i class="fa fa-th-list"></i></button>
              <button type="button" id="grid-view" class="btn btn-default" data-toggle="tooltip" title="Сітка"><i class="fa fa-th"></i></button>
            </div>
          </div>
          <div class="col-sm-2 text-right">
            <label class="control-label" for="input-sort">Сортування:</label>
          </div>
          <div class="col-sm-3 text-right">
            <select id="input-sort" class="form-control" onchange="location = this.value;">
              <?php foreach ($sorts as $sorts) { ?>
              <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
              <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
          <div class="col-sm-1 text-right">
            <label class="control-label" for="input-limit">Показати:</label>
          </div>
          <div class="col-sm-2 text-right">
            <select id="input-limit" class="form-control" onchange="location = this.value;">
              <?php foreach ($limits as $limits) { ?>
              <?php if ($limits['value'] == $limit) { ?>
              <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
              <?php } else { ?>
              <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
              <?php } ?>
              <?php } ?>
            </select>
          </div>
        </div>
      </div>

      <div class="row products-grid">
        <?php foreach ($products as $product) { ?>
        <div class="product-layout product-grid col-lg-3 col-md-3 col-sm-6 col-xs-12">
          <div class="product-thumb">
            <div class="image">
              <a href="<?php echo $product['href']; ?>">
                <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
              </a>
            </div>
            <div class="caption">
              <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
              <?php if ($product['price']) { ?>
              <p class="price">
                <?php if (!$product['special']) { ?>
                <?php echo $product['price']; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $product['special']; ?></span> <span class="price-old"><?php echo $product['price']; ?></span>
                <?php } ?>
              </p>
              <?php } ?>
            </div>
            <div class="button-group">
              <button type="button" class="btn btn-primary btn-block" onclick="cart.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-shopping-cart"></i> <span>В кошик</span></button>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>

      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } else { ?>
      <p>Товарів, що відповідають критеріям пошуку, не знайдено.</p>
      <?php } ?>

      <?php echo $content_bottom; ?>
    </div>

    <?php echo $column_right; ?>
  </div>
</div>

<script type="text/javascript">
$('#button-search').bind('click', function() {
  url = 'index.php?route=product/search';

  var search = $('#content input[name=\'search\']').prop('value');

  if (search) {
    url += '&search=' + encodeURIComponent(search);
  }

  var category_id = $('#content select[name=\'category_id\']').prop('value');

  if (category_id > 0) {
    url += '&category_id=' + encodeURIComponent(category_id);
  }

  var sub_category = $('#content input[name=\'sub_category\']:checked').prop('value');

  if (sub_category) {
    url += '&sub_category=true';
  }

  location = url;
});

$('#content input[name=\'search\']').bind('keydown', function(e) {
  if (e.keyCode == 13) {
    $('#button-search').trigger('click');
  }
});
</script>

<?php echo $footer; ?>
