$(function() {


  function appendSelect() {
        var html = `<select class=“subcategory-form” name=“product[category_id]“ id = "select_id">
                      <option value=“”>---</option>
                    </select>`

      $('.sell-form__detail__select-box__category').append(html);
  }

  $("#product_category_id").change(function(e) {
    e.preventDefault();
    var category_id = $(this).val();
    $.ajax({
      url: "/products/search",
      type: "GET",
      data: {cat: category_id},
      dataType: 'JSON',
    })
    .done(function(categories){
      appendSelect();
      $.each(categories, function(index, category){
        $("#select_id").append(
          $("<option>")
            .val($(category).attr('id'))
            .text($(category).attr('name'))
        )
      });
    })
    .fail(function(){
      alert('fail');
    })
  })
});