Home =
  init: ->
    $('body').on 'ajax:success', '.ama-header-link', @showAmas
    $('body').on 'keyup', '#comment_body:not(.no-submit-on-enter)', @submitComment
    $('body').on 'click', '#sign-up', @showSignUpModal
    $('body').on 'click', '#login', @showLogInModal
    $('body').on 'click', '#close-modal', @closeSignUpModal
    $('body').on 'click', '#close-login', @closeLogInModal
    $('body').on 'click', '#got-it', @closeWelcome

  closeWelcome: ->
    $('#welcome').hide()

  showSignUpModal: ->
    $('.signup-overlay-container').show().addClass('animated fadeIn')

  showLogInModal: ->
    $('.login-overlay-container').show().addClass('animated fadeIn')

  closeSignUpModal: ->
    $('.signup-overlay-container').hide()

  closeLogInModal: ->
    $('.login-overlay-container').hide()

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
