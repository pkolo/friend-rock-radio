$(document).on('turbolinks:load', function() {
  $('#playlists').on('cocoon:after-insert', function(e, newPlaylist) {
    $(newPlaylist).find('.selectize').selectize();
    $('#track').hide()
  })
});
