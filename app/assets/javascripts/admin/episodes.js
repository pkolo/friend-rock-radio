var selectizeTrackCallback = null;
var selectizeCallback = null;

$(document).on('turbolinks:load', function() {
  // After clicking 'Add playlist item'
  $('.edit-playlist-section').on('click', '.add-playlist-item-btn', function(e) {
    var url = window.location.pathname
    var episodePath = url.substring(url.indexOf('/episodes'), url.indexOf('/edit'))
    var adminEpisodePath = `/admin${episodePath}`

    // Get new playlist form and insert it
    $.ajax({
      url: `${adminEpisodePath}/playlists/new`
    }).done(function(res) {
      $('.playlist').append(res)
      let newPlaylist = $('.new-playlist-item')

      // Action to create new playlist item
      $('#new_playlist').on('submit', function(e) {
        e.preventDefault();
        $.ajax({
          method: 'POST',
          url: `${adminEpisodePath}/playlists`,
          data: $(this).serialize()
        }).done(response => {
          $('.new-playlist-item').remove()
          $('.playlist').append(response)
        })
      })

      // Action to create new track from modal form
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

      // Handles closing of modal / form cancellation
      $(newPlaylist).on('click', '.close', function(e) {
        $('.modal').hide();

        // Triggers and resets callback functions so typing is re-enabled
        if (selectizeTrackCallback != null) {
          selectizeTrackCallback();
          selectizeTrackCallback = null;
        }

        if (selectizeCallback != null) {
          selectizeCallback();
          selectizeCallback = null;
        }

        // Clears selectize fields
        let selectFields = $('select')
        $.each( selectFields, function(i, value) {
            let selectField = value.selectize;
            selectField.clear();
          })
      })

      // Adds selectize / track creation to track select field
      $(newPlaylist).find('.selectize').selectize({
        create: function(input, callback) {
          selectizeTrackCallback = callback;

          $('.modal').show();
          $('#new_track').trigger('reset');
          $('.track-title-input').val(input);
        }
      });

      // Adds selectize and creation for bands, genres, labels
      var selectizeFor = function(param) {
        $(newPlaylist).find(`.selectize-${param}`).selectize({
          plugins: ['remove_button'],
          delimiter: ',',
          persist: false,
          closeAfterSelect: true,
          openOnFocus: false,
          create: function(input, callback) {
            data = `${param}[name]=${input}`
            selectizeCallback = callback

            $.ajax({
              method: 'POST',
              url: `/admin/${param}s`,
              data: data,
              success: function(response) {
                console.log(response);
                selectizeCallback({value: response.id, text: response.name});
                selectizeCallback = null;
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
});
