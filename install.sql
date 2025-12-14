-- Інсталяційний SQL скрипт для теми TechnoDron
-- Версія: 1.0.0
-- Для ocStore 2.3.0.2.4

-- Реєстрація теми в системі
INSERT IGNORE INTO `oc_extension` (`type`, `code`)
VALUES ('theme', 'tehnodron');

-- Якщо у вас інший префікс таблиць (не oc_), замініть oc_ на ваш префікс
-- Наприклад для префіксу shop_:
-- INSERT IGNORE INTO `shop_extension` (`type`, `code`) VALUES ('theme', 'tehnodron');
