document.addEventListener("turbolinks:load", function() {
  if ($('[data-scroll="infinite"]').size() > 0) {
    $(window).on('scroll', function() {
      more_posts_url = $('.pagination .next-page a').attr('href');
      if (more_posts_url && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
        // $('.pagination').html('<img src="/assets/ajax-loader.gif" alt="Loading..." title="Loading..." />');
        $.getScript(more_posts_url)
        return
      }
      return
    })
  }
})
