<div class="featured-products">
  <h3 class="module-title"><?php echo $heading_title; ?></h3>
  <div class="row">
    <?php foreach ($products as $product) { ?>
    <div class="product-layout col-lg-3 col-md-3 col-sm-6 col-xs-12">
      <div class="product-thumb">
        <div class="image">
          <a href="<?php echo $product['href']; ?>">
            <img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" title="<?php echo $product['name']; ?>" class="img-responsive" />
          </a>
        </div>
        <div class="caption">
          <h4><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></h4>
          <?php if ($product['rating']) { ?>
          <div class="rating">
            <?php for ($i = 1; $i <= 5; $i++) { ?>
            <?php if ($product['rating'] < $i) { ?>
            <span class="fa fa-stack"><i class="fa fa-star-o fa-stack-1x"></i></span>
            <?php } else { ?>
            <span class="fa fa-stack"><i class="fa fa-star fa-stack-1x"></i></span>
            <?php } ?>
            <?php } ?>
          </div>
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
</div>
