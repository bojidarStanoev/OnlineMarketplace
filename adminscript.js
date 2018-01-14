$(document).ready(function(){
  $("#createcategory").click(function(){

    $("form").empty();
    $("form").append("Name: <input type='text' id='name' name='name'<br> "+
    "<button id=category_c value='Submit'   class='btn btn-primary'>");
  });
  $(document).on("click", "#category_c" , function() {
    var formData = {};
    formData.name = $('#name').val();
    $.ajax({
      type: "POST",
      url: "http://localhost:3000/categories/",
      data: JSON.stringify(formData),
      async: true,
      success: function (msg) {
          console.log(msg);
      },
      cache: false,
      contentType: false,
      processData: false
    });
  });
  $("#deletecategory").click(function(){

    $("form").empty();
    $("form").append("Id: <input type='number' id='number' name='name'<br> "+
    "<button id=category_d value='Submit'   class='btn btn-primary'>");
  });
  $(document).on("click", "#category_d" , function() {
    $.ajax({
      type: "DELETE",
      url: "http://localhost:3000/categories/" + $('#number').val(),
      async: true,
      success: function (msg) {
          console.log(msg);
      },
      cache: false,
      contentType: false,
      processData: false
    });
  });

  $("#editcategory").click(function(){

    $("form").empty();
    $("form").append("Name: <input type='text' id='name' name='name'<br> "+
    "Id: <input type='number' id='number'><br>" +
    "<button id=category_e value='Submit'   class='btn btn-primary'>");
  });
  $(document).on("click", "#category_e" , function() {
    var formData = {};
    formData.name = $('#name').val();
    $.ajax({
      type: "PUT",
      url: "http://localhost:3000/categories/" + $('#number').val(),
      data: JSON.stringify(formData),
      async: true,
      success: function (msg) {
          console.log(msg);
      },
      cache: false,
      contentType: false,
      processData: false
    });
  });
  $("#createproduct").click(function(){

    $("form").empty();
    $("form").append("Product name: <input type='text' id='name'<br> "+
      "Description: <textarea cols='40' rows='5' id='description'</textarea><br> "+
      "Price: <input type='number' step='0.01' id='price'><br>" +
      "Brand_id: <input type='number' id='brand_id'><br>" +
      "Subcategory_id: <input type='number' step='0.01' id='Category_id'><br>" +
      "<button id=product_c value='Submit'   class='btn btn-primary'>");
  });
  $(document).on("click", "#prouct_c" , function() {
    var formData = {};
    formData.name = $('#name').val();
    $.ajax({
      type: "POST",
      url: "http://localhost:3000/products/",
      data: JSON.stringify(formData),
      async: true,
      success: function (msg) {
          console.log(msg);
      },
      cache: false,
      contentType: false,
      processData: false
    });
  });













});
