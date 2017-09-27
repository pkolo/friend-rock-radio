$(document).on('turbolinks:load', function() {
  $('#playlists').on('cocoon:after-insert', function(e, newTrack) {
    $(newTrack).find('.selectize').selectize();
  })
});
