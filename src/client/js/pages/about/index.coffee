template	= require '../../templates/about/index.jade'



class About extends Backbone.View

	id: 'about'


	initialize: ->

		@load()


	load: ->

		@listeners()
		@render()


	listeners: ->



	render: ->

		@$el.html template()



module.exports = About