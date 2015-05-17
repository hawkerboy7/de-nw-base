template	= require './templates/navigation/index.jade'



class Navigation extends Backbone.View

	id: 'navigation'

	events:
		'mousedown button'	: 'navigate'


	initialize: ->

		@load()


	load: ->

		@render()


	render: ->

		@$el.html template()


	navigate: (e) ->

		return if e.button isnt 0

		App.Vent.trigger 'navigate', e.target.name



module.exports = Navigation