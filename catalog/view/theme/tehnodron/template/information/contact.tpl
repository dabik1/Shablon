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

      <h3>Наші контакти</h3>
      <div class="panel panel-default">
        <div class="panel-body">
          <div class="row">
            <div class="col-sm-3">
              <strong>Адреса</strong>
            </div>
            <div class="col-sm-9">
              <?php echo $store; ?>
            </div>
          </div>
        </div>
      </div>

      <?php if ($geocode) { ?>
      <h3>Як нас знайти</h3>
      <div id="map" style="height: 400px; margin-bottom: 20px;"></div>
      <?php } ?>

      <h3>Зв'яжіться з нами</h3>
      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" class="form-horizontal">
        <fieldset>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-name"><?php echo $entry_name; ?></label>
            <div class="col-sm-10">
              <input type="text" name="name" value="<?php echo $name; ?>" id="input-name" class="form-control" />
              <?php if ($error_name) { ?>
              <div class="text-danger"><?php echo $error_name; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-email"><?php echo $entry_email; ?></label>
            <div class="col-sm-10">
              <input type="text" name="email" value="<?php echo $email; ?>" id="input-email" class="form-control" />
              <?php if ($error_email) { ?>
              <div class="text-danger"><?php echo $error_email; ?></div>
              <?php } ?>
            </div>
          </div>
          <div class="form-group required">
            <label class="col-sm-2 control-label" for="input-enquiry"><?php echo $entry_enquiry; ?></label>
            <div class="col-sm-10">
              <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"><?php echo $enquiry; ?></textarea>
              <?php if ($error_enquiry) { ?>
              <div class="text-danger"><?php echo $error_enquiry; ?></div>
              <?php } ?>
            </div>
          </div>
        </fieldset>
        <div class="buttons">
          <div class="pull-right">
            <button class="btn btn-primary" type="submit"><?php echo $button_submit; ?></button>
          </div>
        </div>
      </form>

      <?php if (isset($content_bottom)) { echo $content_bottom; } ?>
    </div>

    <?php if (isset($column_right)) { echo $column_right; } ?>
  </div>
</div>

<?php if ($geocode) { ?>
<script type="text/javascript" src="//maps.google.com/maps/api/js?sensor=false"></script>
<script type="text/javascript">
$(document).ready(function() {
  var geocoder = new google.maps.Geocoder();

  geocoder.geocode({ 'address': '<?php echo $geocode; ?>'}, function(results, status) {
    if (status == google.maps.GeocoderStatus.OK) {
      var map = new google.maps.Map(document.getElementById('map'), {
        zoom: 15,
        center: results[0].geometry.location,
        mapTypeId: google.maps.MapTypeId.ROADMAP,
        scrollwheel: false
      });

      var marker = new google.maps.Marker({
        position: results[0].geometry.location,
        map: map
      });
    }
  });
});
</script>
<?php } ?>

<?php echo $footer; ?>
