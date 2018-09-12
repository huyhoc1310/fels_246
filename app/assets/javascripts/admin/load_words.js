$(document).ready(function () {
  $('#category_select').change(function () {
    var category = $(this).val();
    $.ajax({
      url: "/admin/categories/" + category,
      method: "GET",
      dataType: "json",
      // data: {id: category}
      // error: function (xhr, status, error) {
      //   console.error('AJAX Error: ' + status + error);
      // },
      success: function (response) {
        console.log(response);

        var words = response;
        for (var i=0; i< words.length; i++){
          $('#words_select').append('<option value="' + words[i]["id"] + '">' + words[i]["name"] + '</option>');
        }
      }
      // }
    });
  });
});
