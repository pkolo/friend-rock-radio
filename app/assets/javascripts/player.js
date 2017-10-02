$(document).ready(function() {

  $('audio').mediaelementplayer({
  	success: function(player, node) {
  		$('.content-container').on('click', '.playlist-time', function(e) {
        e.preventDefault();
        let timecode = $(this).attr('href').substring(1);
        player.currentTime = timecode
      })
  	}
  });
})
