#--------------------------------------------------
#	Require Pages
#--------------------------------------------------
Home		= require './pages/home'
About		= require './pages/about'
Navigation	= require './navigation'



#--------------------------------------------------
#	Main - Handles the routing events and initializes all pages
#--------------------------------------------------
class Main extends Backbone.View

	id: 'main'

	initialize: ->

		@load()


	load: ->

		@browserSync()
		@build()
		@render()
		@listeners()


	build: ->

		@home		= new Home
		@about		= new About
		@navigation	= new Navigation


	listeners: ->

		App.Vent.on 'navigate', (location) => @show location


	render: ->

		# Add navigation to the main
		@$el.html @navigation.el

		# Create a pages container
		@pages = $ '<div id="pages"></div>'

		# Add pages
		@pages.append @home.el
		@pages.append @about.el

		# Add pages div to the main
		@$el.append @pages

		# Landing page
		@show 'home'

		# Fade in app once it's rendered (time is a guess)
		setTimeout(=>
			@$el.addClass 'show-me'
		,300)


	show: (location) ->

		# Guard prevents navigation to an unknown page
		return console.log "Page #{location} doesn 't exist" unless @[location]

		# Don't navigate if active is also the next page
		return if @active is location

		@[@active]?.$el.removeClass 'show-me'
		@[location].$el.addClass 'show-me'

		# Store new active page
		@active = location


	browserSync: ->

		interval = setInterval(=>

			# Search for the notifications
			bs = document.getElementById '__bs_notify__'

			# Continue if bs if found
			return unless bs

			# Stop interval
			clearInterval interval

			# Stop interval
			$('#scripts').append $ bs

		,50)



module.exports = Main