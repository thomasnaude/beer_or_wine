document.addEventListener("turbolinks:load", function() {
  $("input[data-autocomplete='true']").autocomplete({
    source: function (request, response) {
      var url = $("input[data-autocomplete='true']").data('url');
      $.get(url, {
          query: request.term
      }, function (data) {
          response(data);
      });
    },
    minLength: 3
  });
});
