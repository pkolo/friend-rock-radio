$(document).on('turbolinks:load', function() {
  $('#playlists').on('cocoon:after-insert', function(e, newPlaylist) {

    $('.create-playlist-btn').on('click', function(e) {
      e.preventDefault();
    })

    $('#playlists').on('click', '.close', function(e) {
      $(this).parents('.modal')[0].style.display = 'none';
    })

    $(newPlaylist).find('.selectize').selectize({
      create: function(input, callback) {
        $('.modal').show();
        $('.track-title-input').val(input);
      }
    });
  })
});
