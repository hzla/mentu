Ama =
  init: ->
    $('body').on 'ajax:success', '#question-form', @addQuestion
    $('body').on 'ajax:success', '.reply-form', @addReply
    $('body').on 'ajax:success', '.comment-form', @addComment
    $('body').on 'ajax:success', '.upvote-link', @upvoteComment
    $(".best_in_place").best_in_place()
    $('body').on 'click', '#sort-new', @sortCommentsByDate
    $('body').on 'click', '#sort-popular', @sortCommentsByScore
    $('body').on 'ajax:success', '.admin-delete', @deleteComments
    $(window).on 'scroll', @makeCommentsScrollable
    $('#questions textarea').focus @glow
    $('#questions textarea').blur @removeGlow
    @initCountdown()

  glow: ->
    console.log $(@)
    $(@).addClass('glower')

  removeGlow: ->
    $(@).removeClass('glower')

  makeCommentsScrollable: ->
   if $('#questions').length > 0
    if $(window).scrollTop() + 1 > $(window).height() 
      $('#questions').css 'overflow-y', 'scroll'
      $('#main-header').addClass('outlined')
    else
      $('#questions').css 'overflow-y', 'hidden'
      $('#main-header').removeClass('outlined')

  deleteComments: (event, data) ->
    $(@).parents(".admin-actions").parent().hide()


  initCountdown: ->
    if $('#countdown').length > 0
      count = parseInt($('#countdown').attr('data-countdown'))
      counter = setInterval ->
        count = count - 1

        seconds = count % 60
        minutes = Math.floor(count / 60)
        hours = Math.floor(minutes / 60)
        minutes %= 60

        if seconds < 10
          seconds = "0" + seconds
        if minutes < 10
          minutes = "0" + minutes

        $('#countdown').text("#{hours}:#{minutes}:#{seconds}")
      , 1000

  sortCommentsByDate: ->
    $people = $('#questions')
    $peopleli = $people.children('.question-thread')

    $peopleli.sort (a,b) -> 
      an = parseInt(a.getAttribute('data-time'))
      bn = parseInt(b.getAttribute('data-time'))

      if an > bn
        return 1
      if an < bn
        return -1
      return 0
    $peopleli.detach().appendTo($people);

    $('.question-thread').addClass('animated fadeIn')
    $('.sort-option').removeClass('active')
    $(@).addClass('active')

  sortCommentsByScore: ->
    $people = $('#questions')
    $peopleli = $people.children('.question-thread')

    $peopleli.sort (a,b) -> 
      an = parseInt(a.getAttribute('data-score'))
      bn = parseInt(b.getAttribute('data-score'))

      if an < bn
        return 1
      if an > bn
        return -1
      return 0
    $peopleli.detach().appendTo($people);

    $('.question-thread').addClass('animated fadeIn')
    $('.sort-option').removeClass('active')
    $(@).addClass('active')


  upvoteComment: (event, data) ->
    $(@).parent().find('.upvote-value').text(data.score)

  addComment: (event, data) ->
  	$(@).parents('.user-comment-form').before(data)
  	$(@).parents('.user-comment-form').prev().addClass('animated fadeIn')
  	$(@)[0].reset()
  	
  addReply: (event, data) ->
  	$(@).parents('.mentor-reply-form').after(data)
  	$(@).parents('.mentor-reply-form').next().addClass('animated fadeIn')
  	$(@)[0].reset()


  addQuestion: (event, data) ->
  	$('#questions').prepend(data)
  	$('.question-thread').first().addClass('animated fadeIn')
  	$(@)[0].reset()
    

ready = ->
  Ama.init()
$(document).ready ready
$(document).on 'page:load', ready
