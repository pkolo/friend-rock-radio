$(document).on('turbolinks:load', function() {
  $('#playlists').on('cocoon:after-insert', function(e, newPlaylist) {
    $(newPlaylist).find('.selectize').selectize({
      create: function(input, callback) {
        $('.track-form').show();
        $('.track-title-input').val(input);

      }
    });
    $('.track-form').hide()
  })
});
