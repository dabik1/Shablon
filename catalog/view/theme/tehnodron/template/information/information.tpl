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

      <div class="information-content">
        <?php echo $description; ?>
      </div>

      <?php if (isset($content_bottom)) { echo $content_bottom; } ?>

      <?php if ($continue) { ?>
      <div class="buttons clearfix">
        <div class="pull-right">
          <a href="<?php echo $continue; ?>" class="btn btn-primary"><?php echo $button_continue; ?></a>
        </div>
      </div>
      <?php } ?>
    </div>

    <?php if (isset($column_right)) { echo $column_right; } ?>
  </div>
</div>

<?php echo $footer; ?>
