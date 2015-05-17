class Server

	constructor: ->

		@load()


	load: ->

		@listeners()


	listeners: ->

		@vent = window.App.Vent

		@vent.on 'button', ->
			console.log 'Server: button clicked!'



module.exports = Server