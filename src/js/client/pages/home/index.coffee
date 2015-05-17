template	= require '../../templates/home/index.jade'



class Home extends Backbone.View

	id: 'home'

	events:
		'mousedown'			: 'mousedown'
		'mousedown button'	: 'button'


	initialize: ->

		@load()


	load: ->

		@listeners()
		@render()


	listeners: ->



	render: ->

		@$el.html template name: 'de-base'


	mousedown: (e) ->

		# Only capture left-mousedown
		return if e.button isnt 0

		console.log 'Home - Mousedown!'


	button: (e) ->

		# Only capture left-mousedown
		return if e.button isnt 0

		# Prevent event form bubbling up
		e.stopPropagation()

		console.log 'Button pressed!'



module.exports = Home