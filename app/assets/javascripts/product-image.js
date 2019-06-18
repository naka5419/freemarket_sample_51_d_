$(function(){
  $(".sell-form__image__upload").change(function(e) {
    var file = e.target.files[0];
    var reader = new FileReader();
    var preview = $(".preview");
    reader.onload = (function(e) {
      var html = $('<div class="preview__image"><img><div class="preview__image__btn"><a class="preview__image__btn__edit">編集</a><a class="preview__image__btn__delete">削除</a></div></div>');
      preview.append(html);
      preview.find('img').attr({
        src: e.target.result,
        height: "114px",
        width: "116px"
      })
    });
    reader.readAsDataURL(file);

    $(".sell-form__image__upload").width(490);
  });
});
