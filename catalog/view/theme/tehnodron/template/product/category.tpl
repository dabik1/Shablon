<?php echo $header; ?>

<div class="container">
  <ul class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <li><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a></li>
    <?php } ?>
  </ul>

  <div class="row">
    <?php if (isset($column_left)) { echo $column_left; } ?>

    <?php if (isset($column_left) && isset($column_right) && $column_left && $column_right) { ?>
    <?php $class = 'col-sm-6'; ?>
    <?php } elseif ((isset($column_left) && $column_left) || (isset($column_right) && $column_right)) { ?>
    <?php $class = 'col-sm-9'; ?>
    <?php } else { ?>
    <?php $class = 'col-sm-12'; ?>
    <?php } ?>

    <div id="content" class="<?php echo $class; ?>">
      <?php if (isset($content_top)) { echo $content_top; } ?>

      <h1><?php echo $heading_title; ?></h1>

      <?php if ($thumb || $description) { ?>
      <div class="category-info">
        <?php if ($thumb) { ?>
        <div class="category-image">
          <img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" title="<?php echo $heading_title; ?>" class="img-thumbnail" />
        </div>
        <?php } ?>
        <?php if ($description) { ?>
        <div class="category-description">
          <?php echo $description; ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?>

      <?php if ($categories) { ?>
      <div class="subcategories">
        <h3>Підкатегорії</h3>
        <div class="row">
          <?php foreach ($categories as $category) { ?>
          <div class="col-sm-3">
            <a href="<?php echo $category['href']; ?>" class="subcategory-item">
              <?php if ($category['thumb']) { ?>
              <img src="<?php echo $category['thumb']; ?>" alt="<?php echo $category['name']; ?>" title="<?php echo $category['name']; ?>" class="img-responsive" />
              <?php } ?>
              <h4><?php echo $category['name']; ?></h4>
            </a>
          </div>
          <?php } ?>
        </div>
      </div>
      <?php } ?>

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
              <?php if ($product['description']) { ?>
              <p class="description"><?php echo mb_substr(strip_tags($product['description']), 0, 100, 'UTF-8'); ?>...</p>
              <?php } ?>
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
              <div class="btn-group">
                <button type="button" class="btn btn-default" data-toggle="tooltip" title="В список бажань" onclick="wishlist.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-heart"></i></button>
                <button type="button" class="btn btn-default" data-toggle="tooltip" title="Порівняти" onclick="compare.add('<?php echo $product['product_id']; ?>');"><i class="fa fa-exchange"></i></button>
              </div>
            </div>
          </div>
        </div>
        <?php } ?>
      </div>

      <div class="row">
        <div class="col-sm-6 text-left"><?php echo $pagination; ?></div>
        <div class="col-sm-6 text-right"><?php echo $results; ?></div>
      </div>
      <?php } ?>

      <?php if (!$categories && !$products) { ?>
      <p>В цій категорії немає товарів.</p>
      <?php } ?>

      <?php if (isset($content_bottom)) { echo $content_bottom; } ?>
    </div>

    <?php if (isset($column_right)) { echo $column_right; } ?>
  </div>
</div>

<?php echo $footer; ?>
