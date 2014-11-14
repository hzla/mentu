Home =
  init: ->
  	$('body').on 'click', '.sign-up', @openSignUpModal
  	$('body').on 'click', '#close-sign-up-modal', @closeSignUpModal
  	$('body').on 'submit', '#user-form', @submitEmail

  submitEmail: ->
  	$('#user-form')[0].reset()
  	$('#submit-email').val 'Thank You!'
  	setTimeout ->
  		$('#submit-email').val 'Submit'
  		Home.closeSignUpModal()
  	, 2000


  openSignUpModal: ->
  	$('#sign-up-modal').show().addClass('animated fadeIn')

  closeSignUpModal: ->
  	$('#sign-up-modal').hide().removeClass('animated fadeIn')
    

ready = ->
  Home.init()
$(document).ready ready
$(document).on 'page:load', ready
