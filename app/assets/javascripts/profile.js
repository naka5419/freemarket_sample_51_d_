$(function() {
  $(".upper-tab__label").eq(0).addClass("active");
  $(".upper-content__pane").eq(0).addClass("active");
  $(".bottom-tab__label").eq(0).addClass("active");
  $(".bottom-content__pane").eq(0).addClass("active");

  $(".upper-tab__label").on("click",function(){
    var $th = $(this).index();
    $(".upper-tab__label").removeClass("active");
    $(".upper-content__pane").removeClass("active");
    $(this).addClass("active");
    $(".upper-content__pane").eq($th).addClass("active");
  });
  $(".bottom-tab__label").on("click",function(){
    var $th = $(this).index();
    $(".bottom-tab__label").removeClass("active");
    $(".bottom-content__pane").removeClass("active");
    $(this).addClass("active");
    $(".bottom-content__pane").eq($th).addClass("active");
  });
});
