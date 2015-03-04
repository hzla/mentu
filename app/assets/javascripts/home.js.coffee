Home =
  init: ->
    $('body').on 'ajax:success', '.ama-header-link', @showAmas
    $('body').on 'keyup', '#comment_body:not(.no-submit-on-enter)', @submitComment
    $('body').on 'click', '#sign-up', @showSignUpModal
    $('body').on 'click', '#login', @showLogInModal
    $('body').on 'click', '#close-modal', @closeSignUpModal
    $('body').on 'click', '#close-login', @closeLogInModal
    $('body').on 'click', '#got-it', @closeWelcome
    $('body').on 'submit', '#new_user', @checkFields
    $('body').on 'click', 'textarea, input, .upvote-container', @forceSignUp
    $(window).on 'scroll', @makeAmasScrollable if $('.amas-container').length > 0 
    
    @startScrollHeight = $('#landing-main').height()
    if $(window).width() < 1024
      @scrollDiff = 6 
    else
      @scrollDiff = 0

  forceSignUp: ->
    if $('.current-user-name').length < 1 
      Home.showSignUpModal()

  checkFields: ->
    emptyName = $('#user_name').val() == ""
    emptyEmail = $('#user_email').val() == ""
    emptyPassword = $('#user_password').val() == ""
    badPassword = $('#user_password').val().length < 6
    $('#new_user input').attr('style', '')

    $('#user_name').css('border', '1px solid red') if emptyName
    $('#user_email').css('border', '1px solid red') if emptyEmail
    $('#user_password').css('border', '1px solid red') if emptyPassword
    $('#user_password').css('border', '1px solid red') if badPassword

    if emptyName || emptyEmail || emptyPassword || badPassword
      return false

  makeAmasScrollable: ->
    console.log Home.startScrollHeight
    console.log $(window).scrollTop() + Home.scrollDiff
    if $(window).scrollTop() + Home.scrollDiff > Home.startScrollHeight 
      $('.amas-container').css 'overflow-y', 'scroll'
      $('#landing-ama').css('z-index', '2')
    else
      $('.amas-container').css 'overflow-y', 'hidden'
      $('#landing-ama').css('z-index', '0')


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
    console.log e.keyCode
    if e.keyCode == 13
      console.log "hey"
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
