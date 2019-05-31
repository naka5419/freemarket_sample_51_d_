$(function () {
  //1番目の画像を末尾に複製
  // $('#gallery').append($('.natukasi').clone().get());
  // // 5番目の画像を末尾に複製
  // $('#gallery').prepend($('.img').eq(2).clone().get());

  $('#prev').click(function() {
    $('#prev').attr('disabled', true);
    if (parseInt($('#gallery').css('left')) == 0) {
      // 最後へ進む
      $('#gallery').animate({
        left: '-2880px'
      }, 500);
    } else {
      // 右に移動
    $('#gallery').animate({
      left: '+=1440px'
    }, 500);
    }
  });

  $('#next').click(function() {
    $('#next').attr('disabled', true);
    if (parseInt($('#gallery').css('left')) == -2880) {
      // 最初に戻る
      $('#gallery').animate({
        left: '0px'
      }, 500);
    } else {
      // 左に移動
    $('#gallery').animate({
      left: '-=1440px'
    }, 500);
    }
  });

  $('.left-dot').hover(function() {
    $('#gallery').animate({
      left: '0px'
    }, 500);
  })
  $('.center-dot').hover(function() {
    $('#gallery').animate({
      left: '-1440px'
    }, 500);
  })
  $('.right-dot').hover(function() {
    $('#gallery').animate({
      left: '-2880px'
    }, 500);
  })
  // if (parseInt($('#gallery').css('left')) == 0) {
  //   $('.left-dot').css('background', 'black');
  // } else if (parseInt($('#gallery').css('left')) == -2880) {
  //   $('.right-dot').css('background', 'black');
  // } else {
  //   $('.center-dot').css('background', 'black');
  // }
});