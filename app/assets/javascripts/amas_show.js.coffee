Ama =
  init: ->
    $('body').on 'ajax:success', '#question-form', @addQuestion
    $('body').on 'ajax:success', '.reply-form', @addReply
    $('body').on 'ajax:success', '.comment-form', @addComment
    $('body').on 'ajax:success', '.upvote-link', @upvoteComment

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
