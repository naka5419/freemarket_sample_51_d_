$(function() {
  $('.photo-1').hover(function() {
    $('.gallery').animate({
    left: '0px'
    }, 500);
  })
  $('.photo-2').hover(function() {
    $('.gallery').animate({
    left: '-100%'
    }, 500);
  })
  $('.photo-3').hover(function() {
    $('.gallery').animate({
    left: '-200%'
    }, 500);
  })
  $('.photo-4').hover(function() {
    $('.gallery').animate({
    left: '-300%'
    }, 500);
  })
});