$('audio').mediaelementplayer({
  pluginPath: '/build',
	success: function(player, node) {
		console.log('works')
	}
});

console.log('no')
