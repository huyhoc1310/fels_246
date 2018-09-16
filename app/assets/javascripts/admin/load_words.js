$(document).ready(function () {

  idArray = [];
  function find_fieldID () {
    $('.category_select').each(function (i, e) {
      if (idArray.indexOf($(e).attr('id').replace(/\D/g,'')) === -1) {
        idArray.push($(e).attr('id').replace(/\D/g,''));
      }
    });
  }
  find_fieldID();

  function load_words () {
    for (var i = 0; i < idArray.length; i++) {
      (function (index) {
        $('#lesson_lesson_words_attributes_' + idArray[index] + '_category_id').change(function () {
          var category = $(this).val();
          console.log(idArray[index]);
          $.ajax({
            url: "/admin/categories/" + category,
            method: "GET",
            dataType: "json",
            error: function (xhr, status, error) {
              console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
              console.log(response);
              var words = response;
              for (var j = 0; j < words.length; j++) {
                (function (word_index) {
                  $('#lesson_lesson_words_attributes_' + idArray[index] + '_word_id').append('<option value="' + words[word_index]["id"] + '">' + words[word_index]["name"] + '</option>');
                })(j)
              }
              debugger;
            }
          });
        });
      })(i);
    }
  }
  load_words();

  $(document).on("cocoon:after-insert", function () {
    find_fieldID();
    load_words();
  });
});
