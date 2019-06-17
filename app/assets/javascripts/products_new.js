$(function() {


  function appendSelect() {
        var html = `<select class=“subcategory-form” name=“product[category_id]“ id = "select_id">
                      <option value=“”>---</option>
                    </select>`

      $('.sell-form__detail__select-box__category').append(html);
  }

  function appendChildSelect() {
    var html = `<select class=“subcategory-form” name=“product[category_id]“ id = "child_id">
                  <option value=“”>---</option>
                </select>`

  $('.sell-form__detail__select-box__category').append(html);
  }

  $("#product_category_id").change(function(e) {
    e.preventDefault();
    $("#select_id, #child_id").remove();
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
  })

  $(document).on('change', "#select_id", function(e){
    e.preventDefault();
    $("#child_id").remove();
    var childCategory_id = $(this).val();
    $.ajax({
      type: "GET",
      url: "/products/search",
      data: {childCat: childCategory_id},
      dataType: 'json'
    })
    .done(function(childCategories){
      appendChildSelect();
      $.each(childCategories, function(index, childCategory){
        $("#child_id").append(
          $("<option>")
            .val($(childCategory).attr('id'))
            .text($(childCategory).attr('name'))
        )
      });
    })
  })
});