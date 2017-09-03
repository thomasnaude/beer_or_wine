$(function() {
  $("input[data-autocomplete='appellation']").autocomplete({
    source: function (request, response) {
      var url = $("input[data-autocomplete='appellation']").data('url');
      $.get(url, {
          query: request.term
      }, function (data) {
          response(data);
      });
    },
    minLength: 3
  });
});
