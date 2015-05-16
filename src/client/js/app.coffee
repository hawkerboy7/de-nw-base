#--------------------------------------------------
#	Init App with jQuery
#--------------------------------------------------
window.$			= require 'jquery'
window.jQuery		= window.$


#--------------------------------------------------
#	Load modules
#--------------------------------------------------
window._			= require 'underscore'
window.Backbone		= require 'backbone'
window.io			= require 'socket.io-client'


#--------------------------------------------------
#	Bind modules
#--------------------------------------------------
window.Backbone.$	= window.$


#--------------------------------------------------
#	Load Main view
#--------------------------------------------------
Main				= require './main'


#--------------------------------------------------
#	Start Application
#--------------------------------------------------
start = ->

	# (Re)Set App, Event emitter and Settings object
	window.App =

		# Store event emitter
		Vent: _.extend {}, window.Backbone.Events

		# Store application setting
		Settings: {}

	# Remove window listeners
	$(window).off()

	# Previous main
	main = document.getElementById 'main'

	# Remove previous main
	$(main).remove()

	# Clear the console on re-connect
	console.clear() if main

	# Start main view
	$('body').prepend (new Main).el


#--------------------------------------------------
#	Listen for connection when the DOM is ready
#--------------------------------------------------
$ ->
	start()
