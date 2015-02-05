Ama =
  init: ->
    $('body').on 'ajax:success', '#question-form', @addQuestion
    $('body').on 'ajax:success', '.reply-form', @addReply
    $('body').on 'ajax:success', '.comment-form', @addComment
    $('body').on 'ajax:success', '.upvote-link', @upvoteComment
    $(".best_in_place").best_in_place()
    $('body').on 'click', '#sort-new', @sortCommentsByDate
    $('body').on 'click', '#sort-popular', @sortCommentsByScore

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
