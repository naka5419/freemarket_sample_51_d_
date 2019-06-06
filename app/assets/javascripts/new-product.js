$(document).on('turbolinks:load', function(){
  // var images = [];
  // var image_field = $("#image_field");
  // var upload_field = $("#upload_field");
  // var fr = new FileReader();

  // function buildHTML() {
  //   html = `
  //   <div class=product__image>
  //     <img src=$"//www-mercari-jp.akamaized.net/assets/img/common/common/logo.svg?3856598694">
  //     <div class="product__image__action">
  //       <div class="product__image__action__edit" >
  //         編集
  //       </div>
  //       <div>
  //         <a class="product__image__action__delete">削除</a>
  //       </div>
  //     </div>
  //   </div>`
  //   return html
  // };

  // image_field.on('mouseover', function() {
  //   image_field.width("70%");
  // });
  // image_field.on('click', function() {
  //   image_field.width("88%");
  // });
});

$(function() {
  $(document).on('keyup', '.input-price', function() {
    profitCal();
  });
});

$(document).on('turbolinks:load', function(){
  profitCal();
});

function profitCal() {
  let input = $(".input-price").val() / 1;
  let chargeForm = $(".sell-form__price__box__charge__right");
  let profitForm = $(".sell-form__price__box__profit__right");
  
  if (input < 300 || input > 9999999) {
    chargeForm.text("-");
    profitForm.text("-");
    return false;
  }

  let charge = parseInt(input / 10);
  if(charge) {
    chargeForm.text("¥" + charge.toLocaleString());

    let profit = input - charge;
    profitForm.text("¥" + profit.toLocaleString());
  }
}