<div class="list-group">
  <h3 class="module-title">Особистий кабінет</h3>
  <a class="list-group-item" href="<?php echo $account; ?>">Мій обліковий запис</a>
  <?php if ($logged) { ?>
  <a class="list-group-item" href="<?php echo $edit; ?>">Редагувати обліковий запис</a>
  <a class="list-group-item" href="<?php echo $password; ?>">Пароль</a>
  <a class="list-group-item" href="<?php echo $address; ?>">Адресна книга</a>
  <a class="list-group-item" href="<?php echo $wishlist; ?>">Список бажань</a>
  <a class="list-group-item" href="<?php echo $order; ?>">Історія замовлень</a>
  <a class="list-group-item" href="<?php echo $download; ?>">Завантаження</a>
  <?php if ($reward) { ?>
  <a class="list-group-item" href="<?php echo $reward; ?>">Бонусні бали</a>
  <?php } ?>
  <a class="list-group-item" href="<?php echo $return; ?>">Повернення</a>
  <a class="list-group-item" href="<?php echo $transaction; ?>">Транзакції</a>
  <a class="list-group-item" href="<?php echo $newsletter; ?>">Розсилка</a>
  <a class="list-group-item" href="<?php echo $recurring; ?>">Регулярні платежі</a>
  <a class="list-group-item" href="<?php echo $logout; ?>">Вихід</a>
  <?php } else { ?>
  <a class="list-group-item" href="<?php echo $login; ?>">Вхід</a>
  <a class="list-group-item" href="<?php echo $register; ?>">Реєстрація</a>
  <a class="list-group-item" href="<?php echo $forgotten; ?>">Забули пароль?</a>
  <?php } ?>
</div>
