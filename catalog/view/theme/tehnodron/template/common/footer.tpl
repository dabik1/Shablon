<footer id="footer">
  <div class="footer-top">
    <div class="container">
      <div class="row">
        <div class="col-sm-3">
          <h5>Інформація</h5>
          <ul class="list-unstyled">
            <?php foreach ($informations as $information) { ?>
            <li><a href="<?php echo $information['href']; ?>"><?php echo $information['title']; ?></a></li>
            <?php } ?>
          </ul>
        </div>
        <div class="col-sm-3">
          <h5>Служба підтримки</h5>
          <ul class="list-unstyled">
            <li><a href="<?php echo $contact; ?>">Зв'язатися з нами</a></li>
            <li><a href="<?php echo $return; ?>">Повернення товару</a></li>
            <li><a href="<?php echo $sitemap; ?>">Карта сайту</a></li>
          </ul>
        </div>
        <div class="col-sm-3">
          <h5>Особистий кабінет</h5>
          <ul class="list-unstyled">
            <li><a href="<?php echo $account; ?>">Особистий кабінет</a></li>
            <li><a href="<?php echo $order; ?>">Історія замовлень</a></li>
            <li><a href="<?php echo $wishlist; ?>">Список бажань</a></li>
            <li><a href="<?php echo $newsletter; ?>">Розсилка</a></li>
          </ul>
        </div>
        <div class="col-sm-3">
          <h5>Контакти</h5>
          <ul class="list-unstyled">
            <li><i class="fa fa-map-marker"></i> Адреса магазину</li>
            <li><i class="fa fa-phone"></i> Телефон: +380</li>
            <li><i class="fa fa-envelope"></i> Email: info@tehnodron.in.ua</li>
          </ul>
          <div class="social-icons">
            <a href="#" class="facebook"><i class="fa fa-facebook"></i></a>
            <a href="#" class="twitter"><i class="fa fa-twitter"></i></a>
            <a href="#" class="instagram"><i class="fa fa-instagram"></i></a>
            <a href="#" class="youtube"><i class="fa fa-youtube"></i></a>
          </div>
        </div>
      </div>
    </div>
  </div>

  <div class="footer-bottom">
    <div class="container">
      <div class="row">
        <div class="col-sm-6">
          <p><?php echo $powered; ?></p>
        </div>
        <div class="col-sm-6 text-right">
          <p>© <?php echo date('Y'); ?> TechnoDron - Системи безпеки та відеоспостереження</p>
        </div>
      </div>
    </div>
  </div>
</footer>

<!-- Scroll to Top -->
<a id="scrollToTop" href="#" class="scroll-to-top"><i class="fa fa-chevron-up"></i></a>

</div>

<!-- Scripts -->
<script type="text/javascript">
$(document).ready(function() {
  // Scroll to top button
  $(window).scroll(function() {
    if ($(this).scrollTop() > 100) {
      $('#scrollToTop').fadeIn();
    } else {
      $('#scrollToTop').fadeOut();
    }
  });

  $('#scrollToTop').click(function() {
    $('html, body').animate({scrollTop: 0}, 800);
    return false;
  });
});
</script>

</body>
</html>
