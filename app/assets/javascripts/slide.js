$(function () {
  $('.center-dot').css('background', 'black');

  $('#prev').click(function() {
    $('.dot').css('background', '#fff');
    if (parseInt($('#gallery').css('left')) == 0) {
      $('#gallery').animate({
        left: '-=200%'
      }, 500);
      $('.right-dot').css('background', 'black');
    } else if (parseInt($('#gallery').css('right')) == 0){
      $('#gallery').animate({
        left: '+=100%'
      }, 500);
      $('.center-dot').css('background', 'black');
    } else {
    $('#gallery').animate({
      left: '+=100%'
    }, 500);
    $('.left-dot').css('background', 'black');
    }
  });

  $('#next').click(function() {
    $('.dot').css('background', '#fff');
    if (parseInt($('#gallery').css('right')) == 0) {
      $('#gallery').animate({
        left: '+=200%'
      }, 500);
      $('.left-dot').css('background', 'black');
    } else if (parseInt($('#gallery').css('left')) == 0){
      $('#gallery').animate({
        left: '-=100%'
      }, 500);
      $('.center-dot').css('background', 'black');
    } else {
    $('#gallery').animate({
      left: '-=100%'
    }, 500);
    $('.right-dot').css('background', 'black');
    }
  });

  $('.left-dot').hover(function() {
    $('.dot').css('background', '#fff');
    $('#gallery').animate({
      left: '0%'
    }, 500);
    $('.left-dot').css('background', 'black');
  })
  $('.center-dot').hover(function() {
    $('.dot').css('background', '#fff');
    $('#gallery').animate({
      left: '-100%'
    }, 500);
    $('.center-dot').css('background', 'black');
  })
  $('.right-dot').hover(function() {
    $('.dot').css('background', '#fff');
    $('#gallery').animate({
      left: '-200%'
    }, 500);
    $('.right-dot').css('background', 'black');
  })
});