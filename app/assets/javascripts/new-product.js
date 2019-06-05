$(document).on('turbolinks:load', function(){
  var images = [];
  var image_field = $("#image_field");
  var upload_field = $("#upload_field");
  var fr = new FileReader();

  function buildHTML() {
  html = `
  <div class=product__image>
    <img src=$"//www-mercari-jp.akamaized.net/assets/img/common/common/logo.svg?3856598694">
    <div class="product__image__action">
      <div class="product__image__action__edit" >
        編集
      </div>
      <div>
        <a class="product__image__action__delete">削除</a>
      </div>
    </div>
  </div>`
  return html
  };



  image_field.on('click', function() {
    image_field.width("70%");
  });
  image_field.on('click', function() {
    image_field.width("88%");

  });
});
