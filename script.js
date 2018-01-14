$(document).ready(function(){

  $("#getCategories").click(function(){
    $.getJSON("http://localhost:3000/categories", function(data, status){
      var categories = [];
      jQuery(data).each(function(i, category){
        console.log(category.id, category.name);
        categories.push( "<li id='" + category.id + "' class = 'category dropdown-submenu' > <a class='test' href='#'>" + category.name +  "<ul id='" + category.id +"' class='dropdown-menu subcategories'><li>123</li></ul></a></li>" );
      });
      $("#categories").empty();
      $("#categories").append(categories);
    });
  });


  $(document).on("mouseenter", ".category" , function() {
    $.getJSON("http://localhost:3000/categories/" + this.id, function(data, status){
      var subcategories = [];
      jQuery(data).each(function(i, subcategory){
        console.log(subcategory.id, subcategory.name);
        subcategories.push("<li id='" + subcategory.id + "'class = 'subcategory'> <a class='test' href='#'>" + subcategory.name +"</a></li>");
      });
      $(".subcategories").empty();
      $(".subcategories").append(subcategories);
    });
  });
  $(document).on("click", ".subcategory" , function() {
    $.getJSON("http://localhost:3000/subcategories/" + this.id, function(data, status){
      var products = [];
      jQuery(data).each(function(i, subcategory){
        console.log(subcategory.id, subcategory.name);
        subcategories.push("<li id='" + subcategory.id + "'class = 'subcategory'> <a class='test' href='#'>" + subcategory.name +"</a></li>");
      });
      $(".subcategories").empty();
      $(".subcategories").append(subcategories);
    });
  });


/*  $('.dropdown-submenu').on("click", function(e){
    $(this).next('ul').toggle();
      e.stopPropagation();
      e.preventDefault();
  });
*/










});
