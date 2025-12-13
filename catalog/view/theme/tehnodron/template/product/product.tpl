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

      <div class="product-info">
        <div class="row">
          <div class="col-sm-5">
            <?php if ($thumb || $images) { ?>
            <div class="product-images">
              <div class="main-image">
                <a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class="image-popup">
                  <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="product-main-image" class="img-responsive" />
                </a>
              </div>
              <?php if ($images) { ?>
              <div class="additional-images">
                <?php foreach ($images as $image) { ?>
                <a href="<?php echo $image['popup']; ?>" title="<?php echo $heading_title; ?>" class="thumbnail image-additional">
                  <img src="<?php echo $image['thumb']; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" />
                </a>
                <?php } ?>
              </div>
              <?php } ?>
            </div>
            <?php } ?>
          </div>

          <div class="col-sm-7">
            <h1><?php echo $heading_title; ?></h1>

            <?php if ($manufacturer) { ?>
            <div class="manufacturer">
              <strong>Виробник:</strong> <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a>
            </div>
            <?php } ?>

            <?php if ($model) { ?>
            <div class="model">
              <strong>Модель:</strong> <?php echo $model; ?>
            </div>
            <?php } ?>

            <?php if ($review_status) { ?>
            <div class="rating">
              <span class="fa fa-stack">
                <?php for ($i = 1; $i <= 5; $i++) { ?>
                <?php if ($rating < $i) { ?>
                <i class="fa fa-star-o fa-stack-1x"></i>
                <?php } else { ?>
                <i class="fa fa-star fa-stack-1x"></i>
                <?php } ?>
                <?php } ?>
              </span>
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;"><?php echo $reviews; ?></a> /
              <a href="" onclick="$('a[href=\'#tab-review\']').trigger('click'); return false;">Написати відгук</a>
            </div>
            <?php } ?>

            <hr>

            <div class="product-price">
              <?php if ($price) { ?>
              <h2 class="price">
                <?php if (!$special) { ?>
                <?php echo $price; ?>
                <?php } else { ?>
                <span class="price-new"><?php echo $special; ?></span> <span class="price-old"><?php echo $price; ?></span>
                <?php } ?>
              </h2>
              <?php } ?>
            </div>

            <?php if ($discounts) { ?>
            <div class="discounts">
              <h4>Оптові ціни:</h4>
              <table class="table table-bordered">
                <thead>
                  <tr>
                    <td>Кількість</td>
                    <td>Ціна</td>
                  </tr>
                </thead>
                <tbody>
                  <?php foreach ($discounts as $discount) { ?>
                  <tr>
                    <td><?php echo $discount['quantity']; ?>+</td>
                    <td><?php echo $discount['price']; ?></td>
                  </tr>
                  <?php } ?>
                </tbody>
              </table>
            </div>
            <?php } ?>

            <div id="product" class="product-options">
              <?php if ($options) { ?>
              <hr>
              <h3>Доступні опції</h3>
              <?php foreach ($options as $option) { ?>
              <?php if ($option['type'] == 'select') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label" for="input-option<?php echo $option['product_option_id']; ?>"><?php echo $option['name']; ?></label>
                <select name="option[<?php echo $option['product_option_id']; ?>]" id="input-option<?php echo $option['product_option_id']; ?>" class="form-control">
                  <option value="">--- Оберіть ---</option>
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                  <?php if ($option_value['price']) { ?>
                  (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                  <?php } ?>
                  </option>
                  <?php } ?>
                </select>
              </div>
              <?php } ?>
              <?php if ($option['type'] == 'radio') { ?>
              <div class="form-group<?php echo ($option['required'] ? ' required' : ''); ?>">
                <label class="control-label"><?php echo $option['name']; ?></label>
                <div id="input-option<?php echo $option['product_option_id']; ?>">
                  <?php foreach ($option['product_option_value'] as $option_value) { ?>
                  <div class="radio">
                    <label>
                      <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" />
                      <?php echo $option_value['name']; ?>
                      <?php if ($option_value['price']) { ?>
                      (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                      <?php } ?>
                    </label>
                  </div>
                  <?php } ?>
                </div>
              </div>
              <?php } ?>
              <?php } ?>
              <?php } ?>

              <div class="form-group">
                <label class="control-label" for="input-quantity">Кількість:</label>
                <input type="text" name="quantity" value="<?php echo $minimum; ?>" size="2" id="input-quantity" class="form-control" />
                <input type="hidden" name="product_id" value="<?php echo $product_id; ?>" />
                <br />
                <button type="button" id="button-cart" class="btn btn-primary btn-lg btn-block"><i class="fa fa-shopping-cart"></i> Додати в кошик</button>
              </div>

              <div class="btn-group">
                <button type="button" class="btn btn-default" data-toggle="tooltip" title="В список бажань" onclick="wishlist.add('<?php echo $product_id; ?>');"><i class="fa fa-heart"></i> <span>В список бажань</span></button>
                <button type="button" class="btn btn-default" data-toggle="tooltip" title="Порівняти" onclick="compare.add('<?php echo $product_id; ?>');"><i class="fa fa-exchange"></i> <span>Порівняти</span></button>
              </div>
            </div>
          </div>
        </div>

        <div class="row">
          <div class="col-sm-12">
            <ul class="nav nav-tabs">
              <li class="active"><a href="#tab-description" data-toggle="tab">Опис</a></li>
              <?php if ($attribute_groups) { ?>
              <li><a href="#tab-specification" data-toggle="tab">Характеристики</a></li>
              <?php } ?>
              <?php if ($review_status) { ?>
              <li><a href="#tab-review" data-toggle="tab">Відгуки (<?php echo $review_total; ?>)</a></li>
              <?php } ?>
            </ul>

            <div class="tab-content">
              <div class="tab-pane active" id="tab-description">
                <?php echo $description; ?>
              </div>

              <?php if ($attribute_groups) { ?>
              <div class="tab-pane" id="tab-specification">
                <table class="table table-bordered">
                  <?php foreach ($attribute_groups as $attribute_group) { ?>
                  <thead>
                    <tr>
                      <td colspan="2"><strong><?php echo $attribute_group['name']; ?></strong></td>
                    </tr>
                  </thead>
                  <tbody>
                    <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
                    <tr>
                      <td><?php echo $attribute['name']; ?></td>
                      <td><?php echo $attribute['text']; ?></td>
                    </tr>
                    <?php } ?>
                  </tbody>
                  <?php } ?>
                </table>
              </div>
              <?php } ?>

              <?php if ($review_status) { ?>
              <div class="tab-pane" id="tab-review">
                <form class="form-horizontal" id="form-review">
                  <div id="review"></div>
                  <h2>Написати відгук</h2>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-name">Ваше ім'я</label>
                      <input type="text" name="name" value="" id="input-name" class="form-control" />
                    </div>
                  </div>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label" for="input-review">Ваш відгук</label>
                      <textarea name="text" rows="5" id="input-review" class="form-control"></textarea>
                      <div class="help-block"><span class="text-danger">Примітка:</span> HTML не підтримується!</div>
                    </div>
                  </div>
                  <div class="form-group required">
                    <div class="col-sm-12">
                      <label class="control-label">Оцінка</label>
                      &nbsp;&nbsp;&nbsp; Погано&nbsp;
                      <input type="radio" name="rating" value="1" />
                      &nbsp;
                      <input type="radio" name="rating" value="2" />
                      &nbsp;
                      <input type="radio" name="rating" value="3" />
                      &nbsp;
                      <input type="radio" name="rating" value="4" />
                      &nbsp;
                      <input type="radio" name="rating" value="5" />
                      &nbsp;Відмінно
                    </div>
                  </div>
                  <div class="buttons clearfix">
                    <div class="pull-right">
                      <button type="button" id="button-review" class="btn btn-primary">Продовжити</button>
                    </div>
                  </div>
                </form>
              </div>
              <?php } ?>
            </div>
          </div>
        </div>
      </div>

      <?php echo $content_bottom; ?>
    </div>

    <?php echo $column_right; ?>
  </div>
</div>

<script type="text/javascript">
$('#button-cart').on('click', function() {
  $.ajax({
    url: 'index.php?route=checkout/cart/add',
    type: 'post',
    data: $('#product input[type=\'text\'], #product input[type=\'hidden\'], #product input[type=\'radio\']:checked, #product input[type=\'checkbox\']:checked, #product select, #product textarea'),
    dataType: 'json',
    beforeSend: function() {
      $('#button-cart').button('loading');
    },
    complete: function() {
      $('#button-cart').button('reset');
    },
    success: function(json) {
      if (json['error']) {
        if (json['error']['option']) {
          for (i in json['error']['option']) {
            var element = $('#input-option' + i.replace('_', '-'));
            if (element.parent().hasClass('input-group')) {
              element.parent().after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            } else {
              element.after('<div class="text-danger">' + json['error']['option'][i] + '</div>');
            }
          }
        }
        if (json['error']['recurring']) {
          $('select[name=\'recurring_id\']').after('<div class="text-danger">' + json['error']['recurring'] + '</div>');
        }
        $('.text-danger').parent().addClass('has-error');
      }
      if (json['success']) {
        alert(json['success']);
        $('#cart > button').html('<i class="fa fa-shopping-cart"></i> ' + json['total']);
        $('html, body').animate({ scrollTop: 0 }, 'slow');
      }
    },
    error: function(xhr, ajaxOptions, thrownError) {
      alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
    }
  });
});
</script>

<?php echo $footer; ?>
