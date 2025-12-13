/**
 * TechnoDron Theme - Common JavaScript
 * Version: 1.0.0
 */

$(document).ready(function() {

  // ===================================
  // Scroll to Top Button
  // ===================================
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

  // ===================================
  // Product Image Gallery
  // ===================================
  $('.image-additional a').click(function(e) {
    e.preventDefault();
    var imageUrl = $(this).attr('href');
    $('#product-main-image').attr('src', imageUrl);
  });

  // ===================================
  // Mobile Menu Toggle
  // ===================================
  $('.navbar-toggle').click(function() {
    $(this).toggleClass('active');
  });

  // ===================================
  // Search Box Focus Effect
  // ===================================
  $('#search input[name="search"]').focus(function() {
    $(this).parent().addClass('focused');
  });

  $('#search input[name="search"]').blur(function() {
    $(this).parent().removeClass('focused');
  });

  // ===================================
  // Product Grid/List View Toggle
  // ===================================
  $('#list-view').click(function() {
    $('#content .product-layout').removeClass('product-grid').addClass('product-list');
    $('#grid-view').removeClass('active');
    $('#list-view').addClass('active');

    localStorage.setItem('display', 'list');
  });

  $('#grid-view').click(function() {
    $('#content .product-layout').removeClass('product-list').addClass('product-grid');
    $('#list-view').removeClass('active');
    $('#grid-view').addClass('active');

    localStorage.setItem('display', 'grid');
  });

  // Restore last view preference
  if (localStorage.getItem('display') == 'list') {
    $('#list-view').trigger('click');
  } else {
    $('#grid-view').addClass('active');
  }

  // ===================================
  // Smooth Scrolling for Anchor Links
  // ===================================
  $('a[href*="#"]:not([href="#"])').click(function() {
    if (location.pathname.replace(/^\//, '') == this.pathname.replace(/^\//, '') && location.hostname == this.hostname) {
      var target = $(this.hash);
      target = target.length ? target : $('[name=' + this.hash.slice(1) + ']');
      if (target.length) {
        $('html, body').animate({
          scrollTop: target.offset().top - 100
        }, 1000);
        return false;
      }
    }
  });

  // ===================================
  // Tooltips Initialization
  // ===================================
  $('[data-toggle="tooltip"]').tooltip();

  // ===================================
  // Product Quantity Controls
  // ===================================
  $(document).on('click', '.btn-number', function(e) {
    e.preventDefault();

    fieldName = $(this).attr('data-field');
    type = $(this).attr('data-type');
    var input = $("input[name='" + fieldName + "']");
    var currentVal = parseInt(input.val());

    if (!isNaN(currentVal)) {
      if (type == 'minus') {
        if (currentVal > input.attr('min')) {
          input.val(currentVal - 1).change();
        }
        if (parseInt(input.val()) == input.attr('min')) {
          $(this).attr('disabled', true);
        }
      } else if (type == 'plus') {
        if (currentVal < input.attr('max')) {
          input.val(currentVal + 1).change();
        }
        if (parseInt(input.val()) == input.attr('max')) {
          $(this).attr('disabled', true);
        }
      }
    } else {
      input.val(0);
    }
  });

  // ===================================
  // Alert Auto-Hide
  // ===================================
  setTimeout(function() {
    $('.alert').fadeOut('slow');
  }, 5000);

  // ===================================
  // Image Lazy Loading
  // ===================================
  $('img[data-src]').each(function() {
    var img = $(this);
    img.attr('src', img.data('src'));
    img.removeAttr('data-src');
  });

  // ===================================
  // Newsletter Form Submit
  // ===================================
  $('#newsletter-form').submit(function(e) {
    e.preventDefault();
    var email = $(this).find('input[name="email"]').val();

    if (validateEmail(email)) {
      // Submit form via AJAX
      $.ajax({
        type: 'POST',
        url: 'index.php?route=account/newsletter',
        data: {email: email},
        dataType: 'json',
        success: function(json) {
          if (json['success']) {
            alert('Дякуємо за підписку!');
          }
        }
      });
    } else {
      alert('Будь ласка, введіть коректну email адресу');
    }
  });

  // ===================================
  // Email Validation
  // ===================================
  function validateEmail(email) {
    var re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return re.test(email);
  }

  // ===================================
  // Price Format
  // ===================================
  function formatPrice(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, " ");
  }

  // ===================================
  // Compare Products Counter Update
  // ===================================
  $('#compare-total').click(function() {
    $('#compare').load('index.php?route=product/compare #compare > *');
  });

  // ===================================
  // Wishlist Counter Update
  // ===================================
  $('#wishlist-total').click(function() {
    $('#wishlist').load('index.php?route=account/wishlist #wishlist > *');
  });

  // ===================================
  // Cart Total Update
  // ===================================
  $('#cart > button').on('click', function() {
    $('#cart > ul').load('index.php?route=common/cart/info ul li');
  });

  // ===================================
  // Product Zoom Effect
  // ===================================
  $('.product-thumb .image').hover(
    function() {
      $(this).find('img').addClass('zoomed');
    },
    function() {
      $(this).find('img').removeClass('zoomed');
    }
  );

  // ===================================
  // Header Sticky on Scroll
  // ===================================
  var headerHeight = $('#header').outerHeight();
  var stickyClass = 'sticky-header';

  $(window).scroll(function() {
    if ($(this).scrollTop() > headerHeight) {
      $('#header').addClass(stickyClass);
      $('body').css('padding-top', headerHeight + 'px');
    } else {
      $('#header').removeClass(stickyClass);
      $('body').css('padding-top', '0');
    }
  });

  // ===================================
  // Cookie Notice
  // ===================================
  if (!getCookie('cookie_notice')) {
    $('body').append('<div class="cookie-notice">Ми використовуємо cookies для покращення роботи сайту. <button onclick="acceptCookies()">Прийняти</button></div>');
  }

  // ===================================
  // Counter Animation
  // ===================================
  $('.counter').each(function() {
    var $this = $(this);
    var countTo = $this.attr('data-count');

    $({countNum: $this.text()}).animate({
      countNum: countTo
    },
    {
      duration: 2000,
      easing: 'linear',
      step: function() {
        $this.text(Math.floor(this.countNum));
      },
      complete: function() {
        $this.text(this.countNum);
      }
    });
  });

  // ===================================
  // Back to Previous Page
  // ===================================
  $('.btn-back').click(function() {
    window.history.back();
  });

  // ===================================
  // Print Button
  // ===================================
  $('.btn-print').click(function() {
    window.print();
  });

  // ===================================
  // Share Buttons
  // ===================================
  $('.share-facebook').click(function(e) {
    e.preventDefault();
    window.open('https://www.facebook.com/sharer/sharer.php?u=' + encodeURIComponent(window.location.href), 'facebook-share-dialog', 'width=626,height=436');
  });

  $('.share-twitter').click(function(e) {
    e.preventDefault();
    window.open('https://twitter.com/intent/tweet?url=' + encodeURIComponent(window.location.href), 'twitter-share-dialog', 'width=626,height=436');
  });

});

// ===================================
// Helper Functions
// ===================================

// Get Cookie
function getCookie(name) {
  var value = "; " + document.cookie;
  var parts = value.split("; " + name + "=");
  if (parts.length == 2) return parts.pop().split(";").shift();
}

// Set Cookie
function setCookie(name, value, days) {
  var expires = "";
  if (days) {
    var date = new Date();
    date.setTime(date.getTime() + (days * 24 * 60 * 60 * 1000));
    expires = "; expires=" + date.toUTCString();
  }
  document.cookie = name + "=" + (value || "") + expires + "; path=/";
}

// Accept Cookies
function acceptCookies() {
  setCookie('cookie_notice', 'accepted', 365);
  $('.cookie-notice').fadeOut();
}

// Format Number
function formatNumber(num) {
  return num.toString().replace(/(\d)(?=(\d{3})+(?!\d))/g, '$1 ');
}

// Debounce Function
function debounce(func, wait, immediate) {
  var timeout;
  return function() {
    var context = this, args = arguments;
    var later = function() {
      timeout = null;
      if (!immediate) func.apply(context, args);
    };
    var callNow = immediate && !timeout;
    clearTimeout(timeout);
    timeout = setTimeout(later, wait);
    if (callNow) func.apply(context, args);
  };
}
