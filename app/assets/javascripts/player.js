$(document).ready(function() {

  class Playlist {
    constructor(playlistItems) {
      this.tracks = this.setTracks(playlistItems);
      this.currentTrack = this.getTrackData(playlistItems[0]).title;
    }

    getTrackData(playlistItem) {
      return {
        time: $(playlistItem).find('.playlist-time').data().trackTime,
        title: $(playlistItem).find('.track-basic').text()
      }
    }

    setTracks(playlistItems) {
      let tracks = [];
      let that = this;
      $.each(playlistItems, function(i, item) {
        tracks.push(that.getTrackData(item))
      });
      return tracks;
    }

    setCurrentTrack(time) {
      let newCurrentTrack = this.tracks.find( (item, i, tracks) => {
        if (tracks[i+1]) {
          return (item.time <= time && tracks[i+1].time > time)
        } else {
          return (item)
        }
      })
      if (newCurrentTrack !== this.currentTrack) {
        this.currentTrack = newCurrentTrack.title
      }
    }
  }

  $('audio').mediaelementplayer({
  	success: function(player, node) {
      let playlistItems = $('.playlist-item')
      let playlist = new Playlist(playlistItems);

  		$('.content-container').on('click', '.playlist-time', function(e) {
        e.preventDefault();
        var newCurrentTime = $(this).data().trackTime
        player.setCurrentTime(newCurrentTime);
        playlist.setCurrentTrack(newCurrentTime)
      })

      $(player).on('timeupdate', function() {
        let currentTime = this.getCurrentTime()
        playlist.setCurrentTrack(currentTime)
      })
  	}
  });
})
