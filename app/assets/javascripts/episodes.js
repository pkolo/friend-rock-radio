$(document).on('turbolinks:load', function() {
  $('#playlists').on('cocoon:after-insert', function(e, newPlaylist) {
    // $('.track-form').hide()
    $('.create-playlist-btn').on('click', function(e) {
      e.preventDefault();

    })
    $(newPlaylist).find('.selectize').selectize({
      create: function(input, callback) {
        $('.track-form').show();
        $('.track-title-input').val(input);

      }
    });
  })
});
