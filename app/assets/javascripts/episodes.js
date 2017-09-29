var selectizeTrackCallback = null;
var selectizeBandCallback = null;

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
          selectizeTrackCallback({value: response.id, text: response.title});
          selectizeTrackCallback = null;
          $('.modal').remove();
        }
      })
    });

    $(newPlaylist).on('click', '.close', function(e) {
      $('.modal').hide();
      if (selectizeTrackCallback != null) {
        selectizeTrackCallback();
        selectizeTrackCallback = null;
      }
    })

    $(newPlaylist).find('.selectize').selectize({
      create: function(input, callback) {
        selectizeTrackCallback = callback;

        $('.modal').show();
        $('#new_track').trigger('reset');
        $('.track-title-input').val(input);
      }
    });

    var selectizeFor = function(param) {
      $(newPlaylist).find(`.selectize-${param}`).selectize({
        plugins: ['remove_button'],
        delimiter: ',',
        persist: false,
        create: function(input, callback) {
          data = `${param}[name]=${input}`
          selectizeBandCallback = callback

          $.ajax({
            method: 'POST',
            url: `/${param}s`,
            data: data,
            success: function(response) {
              console.log(response);
              selectizeBandCallback({value: response.id, text: response.name});
              selectizeBandCallback = null;
            }
          })
        }
      })
    }

    selectizeFor("band");
    selectizeFor("label");
    selectizeFor("genre");

  })
});
