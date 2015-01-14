Home =
  init: ->
    $('body').on 'submit', '.landing-modal .edit_user', @validateAndThankUser
    $('body').on 'submit', '#mentor-form .edit_user', @validateAndThankMentor
    $('body').on 'click', '.close-modal', @closeModal
    $('body').on 'click', '#apply-mentor', @showMentorForm
    $('body').on 'click', '.landing-user-field.submit', @saveUserInfoInSession
    $('body').on 'change', '#hidden-essay-upload', @showFile

  showFile: (e) ->
    #shows the filename of the uploaded file
    $('#shown-essay-upload').text($('#hidden-essay-upload').val().split("\\").slice(2))

  saveUserInfoInSession: ->
    form = $(@).parents('form')
    isEmpty = false
    form.find('input').each ->
      empty = $(@).val() == ""
      isEmpty = true if empty
      $(@).css('border', '1px solid red') if empty
    return false if isEmpty
    $(@).parents('form').submit()

  showMentorForm: ->
    $('.modal-header').text('Glad to have you on board!')
    $('.modal-sub-header').text('Please complete the two tasks below:')
    $('#apply-mentor, .hide-on-submit, .animate-on-submit').hide()
    $('#mentor-form, .close-modal').show().addClass('animated fadeIn')

  closeModal: ->
    $('.modal-overlay-container').hide()

  validateAndThankMentor: ->
    isEmpty = false
    
    $('.mentor-field').each ->
      empty = $(@).val() == ""
      isEmpty = true if empty
      $(@).css('border', '1px solid red') if empty
      if $(@).attr('id') == "hidden-essay-upload"
        $('#shown-essay-upload').css('border', '1px solid red') if empty
    return false if isEmpty
  
    $('#mentor-form').animate
      opacity: 0;
      height: 0;
    , 1000,  -> 
      $(@).hide()
    $('.hide-on-submit').hide()
    $('.show-on-submit').show()
    $('#apply-mentor').addClass('applied')
    $('.modal-sub-header').text("We'll send you an email when we're ready to launch")
    $('.modal-header-container').css('border-bottom', 'none')

  validateAndThankUser: ->
    noDreamSchool = $('#user_dream_school').val() == ""
    noMajor = $('#user_major').val() == ""
    noEmail = $('#user_email').val() == ""
    if false #noDreamSchool or noMajor or noEmail
      $('.modal-user-field').each ->
        $(@).css('border', '1px solid red') if $(@).val() == ""
      return false
    else
      $('.animate-on-submit').animate
        opacity: 0;
        height: 0;
      , 500,  -> 
        $(@).hide()
      $('.hide-on-submit').hide()
      $('.show-on-submit').show()
      $('#apply-mentor').addClass('applied')
      $('.modal-sub-header').text("We'll send you an email when we're ready to launch")
      $('.modal-header-container').css('border-bottom', 'none')

ready = ->
  Home.init()
$(document).ready ready
$(document).on 'page:load', ready
