(function() {
  self.link_to_fancybox_or_not = function(url, args) {
    if ($('input#enable_lightbox')[0].checked) {
      return $.fancybox({
        href: url
      });
    } else {
      return document.location = url;
    }
  };
  self.go_back = function() {
    if ($('input#enable_lightbox')[0].checked) {
      return $.fancybox.close();
    } else {
      return history.back();
    }
  };
  $(document).ready(function() {
    $('a.delete_link_fancybox').click(function() {
      if ($('input#enable_lightbox')[0].checked) {
        $.fancybox({
          href: this + '?enable_lightbox=1',
          http_method: 'delete'
        });
        return false;
      } else {
        return confirm('Are you sure?');
      }
    });
    return $('form#form_to_enable_lightbox').change(function() {
      return $('form#form_to_enable_lightbox').submit();
    });
  });
}).call(this);
