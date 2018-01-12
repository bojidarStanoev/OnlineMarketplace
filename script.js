$(document).ready(function(){

  $("#getCategories").click(function(){
    $.getJSON("http://localhost:3000/categories", function(data, status){
      var categories = [];
      jQuery(data).each(function(i, category){
        console.log(category.id, category.name);
        categories.push( "<li id='" + category.id + "' class = 'category list-group-item dropdown-submenu' > " + category.name + "<ul class='dropdown-menu'></li>" );
      });
      $("#categories").empty();
      $("#categories").append(categories);
    });
  });


  $(document).on("click", ".category" , function() {
    $.getJSON("http://localhost:3000/categories/" + this.id, function(data, status){
      var subcategories = [];
      jQuery(data).each(function(i, category){
        console.log(category.id, category.name);
      });
    });
  });



});
