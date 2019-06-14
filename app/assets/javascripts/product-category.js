$(function() {
  function buildChirdrenHTML() { 
    html = `
    <%= f.collection_select :category_id, @parent, :id, :name, {prompt: "---"}, class: "sub-category-form" %>`
  };

  $(".category-form").change(function() {
    var html = buildChirdrenHTML();
    $(".category-form").after(html);
  });
});
