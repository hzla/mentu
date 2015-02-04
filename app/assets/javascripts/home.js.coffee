Home =
  init: ->
  	$('body').on 'ajax:success', '.ama-header-link', @showAmas
  	$('body').on 'keyup', '#comment_body', @submitComment

  submitComment: (e) ->
  	if e.keyCode == 13
  		$(@).parents('form').submit()
  	

  showAmas: (event, data) ->
  	$('.ama-header-tab').removeClass('active')
  	$(@).find('.ama-header-tab').addClass('active')
  	$('#amas-content').html data
  	$('.amas-date, .amas').addClass('animated fadeIn')


 ready = ->
  Home.init()
$(document).ready ready
$(document).on 'page:load', ready
