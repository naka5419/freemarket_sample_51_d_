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
