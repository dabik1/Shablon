<?php echo $header; ?>

<!-- Main Slider -->
<div id="main-slider" class="carousel slide" data-ride="carousel">
  <div class="carousel-inner">
    <div class="item active">
      <div class="slider-content">
        <div class="container">
          <div class="slider-text">
            <h1>Системи безпеки для вашого дому та бізнесу</h1>
            <p>Професійне обладнання для відеоспостереження, сигналізації та контролю доступу</p>
            <a href="index.php?route=product/category" class="btn btn-primary btn-lg">Переглянути каталог</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Featured Products Section -->
<div class="featured-section">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <h2 class="section-title">Рекомендовані товари</h2>
      </div>
    </div>
    <?php echo $content_top; ?>
  </div>
</div>

<!-- Categories Section -->
<div class="categories-section">
  <div class="container">
    <div class="row">
      <div class="col-sm-12">
        <h2 class="section-title">Категорії товарів</h2>
      </div>
    </div>
    <div class="row">
      <div class="col-sm-3">
        <div class="category-box">
          <div class="category-icon">
            <i class="fa fa-video-camera"></i>
          </div>
          <h3>Камери відеоспостереження</h3>
          <p>IP, AHD, аналогові камери</p>
          <a href="#" class="btn btn-default">Переглянути</a>
        </div>
      </div>
      <div class="col-sm-3">
        <div class="category-box">
          <div class="category-icon">
            <i class="fa fa-hdd-o"></i>
          </div>
          <h3>Відеореєстратори</h3>
          <p>DVR, NVR, гібридні системи</p>
          <a href="#" class="btn btn-default">Переглянути</a>
        </div>
      </div>
      <div class="col-sm-3">
        <div class="category-box">
          <div class="category-icon">
            <i class="fa fa-bell"></i>
          </div>
          <h3>Охоронні сигналізації</h3>
          <p>Бездротові та провідні системи</p>
          <a href="#" class="btn btn-default">Переглянути</a>
        </div>
      </div>
      <div class="col-sm-3">
        <div class="category-box">
          <div class="category-icon">
            <i class="fa fa-key"></i>
          </div>
          <h3>Контроль доступу</h3>
          <p>Домофони, замки, турнікети</p>
          <a href="#" class="btn btn-default">Переглянути</a>
        </div>
      </div>
    </div>
  </div>
</div>

<!-- Features Section -->
<div class="features-section">
  <div class="container">
    <div class="row">
      <div class="col-sm-3">
        <div class="feature-box">
          <i class="fa fa-truck"></i>
          <h4>Безкоштовна доставка</h4>
          <p>При замовленні від 3000 грн</p>
        </div>
      </div>
      <div class="col-sm-3">
        <div class="feature-box">
          <i class="fa fa-shield"></i>
          <h4>Гарантія якості</h4>
          <p>Офіційна гарантія на всі товари</p>
        </div>
      </div>
      <div class="col-sm-3">
        <div class="feature-box">
          <i class="fa fa-wrench"></i>
          <h4>Монтаж та налаштування</h4>
          <p>Професійна установка обладнання</p>
        </div>
      </div>
      <div class="col-sm-3">
        <div class="feature-box">
          <i class="fa fa-headphones"></i>
          <h4>Технічна підтримка</h4>
          <p>Консультації 24/7</p>
        </div>
      </div>
    </div>
  </div>
</div>

<?php echo $content_bottom; ?>

<?php echo $footer; ?>
