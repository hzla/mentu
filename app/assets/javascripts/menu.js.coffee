Menu =
	init: ->
		$('body').on 'click', '.mobile-menu', @showMenu
		$('body').on 'mouseenter', '.menu-arrow', @showDeskMenu
		$('body').on 'mouseleave', '#menu', @hideDeskMenu
		$('body').on 'click', @hideMenu

	hideDeskMenu: ->
		$(@).hide()
		
	showDeskMenu: ->
		$('#menu').show()

	showMenu: ->
  	console.log "here"
  	$('#menu').show()
  	$('#menu').addClass('animated fadeInRightBig')

  hideMenu: (e) ->
  	if e.target != $('#menu')[0] && e.target != $('.mobile-menu')[0]
  		$('#menu').hide()


ready = ->
  Menu.init()
$(document).ready ready
$(document).on 'page:load', ready
