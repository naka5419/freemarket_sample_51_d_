$(function() {
  $(".category-form").change(function(e) {
    e.preventDefault();
    var formData = new FormData(this);
    $.ajax({
      url: "/products/search",
      type: "GET",
      data: formData,
      dataType: 'JSON',
      processData: false,
      contentType: false,
    })
    .done(function(){

    })
    .fail(function(){
      
    })
  })
});