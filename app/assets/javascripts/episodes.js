var selectizeCallback = null;

$(document).on('turbolinks:load', function() {
  // After clicking 'Add playlist item'
  $('#playlists').on('cocoon:after-insert', function(e, newPlaylist) {

    $('.create-playlist-btn').on('click', function(e) {
      e.preventDefault();
    })


    $('#new_track').on('submit', function(e) {
      e.preventDefault();
      $.ajax({
        method: "POST",
        url: $(this).attr('action'),
        data: $(this).serialize(),
        success: function(response) {
          console.log(response)
          selectizeCallback({value: response.id, text: response.title});
          selectizeCallback = null;
          $('.modal').remove();
        }
      })
    });

    $('#playlists').on('click', '.close', function(e) {
      $(this).parents('.modal')[0].style.display = 'none';
      if (selectizeCallback != null) {
        selectizeCallback();
        selectizeCallback = null;
      }
    })

    $(newPlaylist).find('.selectize').selectize({
      create: function(input, callback) {
        selectizeCallback = callback;

        $('.modal').show();
        $('#new_track').trigger('reset');
        $('.track-title-input').val(input);
      }
    });
  })
});
