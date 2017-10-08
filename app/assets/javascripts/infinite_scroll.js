document.addEventListener("turbolinks:load", function() {
  if ($('[data-scroll="infinite"]').size() > 0) {
    $(window).bindWithDelay('scroll', function() {
      var more_posts_url = $('.pagination .next-page a').attr('href');
      var scrolled = $('.pagination .next-page a').data('scrolled');
      if (more_posts_url && !scrolled && $(window).scrollTop() > $(document).height() - $(window).height() - 60) {
        $('.pagination .next-page a').data('scrolled', true);
        $.getScript(more_posts_url)
        // return
      }
      // return
    }, 100)
  }
})
