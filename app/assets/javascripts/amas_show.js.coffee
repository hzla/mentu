Ama =
  init: ->
    $('body').on 'ajax:success', '#question-form', @addQuestion
    $('body').on 'ajax:success', '.reply-form', @addReply
    $('body').on 'ajax:success', '.comment-form', @addComment
    $('body').on 'submit', '.reply-form', @showSubmitting
    $('body').on 'ajax:success', '.upvote-link', @upvoteComment
    $(".best_in_place").best_in_place()
    $('body').on 'click', '#sort-new', @sortCommentsByDate
    $('body').on 'click', '#sort-popular', @sortCommentsByScore
    $('body').on 'ajax:success', '.admin-delete', @deleteComments
    $(window).on 'scroll', @makeCommentsScrollable
    $('#questions textarea').focus @expandBox
    $('#questions textarea').blur @shrinkBox
    $('body').on 'ajax:success', '#approval-link', @showApproving
    @initCountdown()
    @startScrollHeight = $('#ama-cover').height()

  expandBox: ->
    $(@).animate
      height: '120px'
    , 250

  shrinkBox: ->
    $(@).animate
      height: '40px'
    , 250

  showApproving: ->
    $(@).find('#submit-ama').text("Pending approval...")

  glow: ->
    $(@).addClass('glower')

  removeGlow: ->
    $(@).removeClass('glower')

  makeCommentsScrollable: ->
   if $('#questions').length > 0
    if $(window).scrollTop() + 1 > Ama.startScrollHeight
      $('#questions').css 'overflow-y', 'scroll'
      $('#main-header').addClass('outlined')
      $('.menu-arrow.black').show()
      $('.menu-arrow.white').hide()
    else
      $('#questions').css 'overflow-y', 'hidden'
      $('#main-header').removeClass('outlined')
      $('.menu-arrow.black').hide()
      $('.menu-arrow.white').show()

  deleteComments: (event, data) ->
    $(@).parents(".admin-actions").parent().hide()


  initCountdown: ->
    if $('#countdown').length > 0
      count = parseInt($('#countdown').attr('data-countdown'))
      counter = setInterval ->
        count = count - 1
        if count > 0
        

          seconds = count % 60
          minutes = Math.floor(count / 60)
          hours = Math.floor(minutes / 60)
          minutes %= 60

          if seconds < 10
            seconds = "0" + seconds
          if minutes < 10
            minutes = "0" + minutes

          $('#countdown').text("#{hours} hours #{minutes} minutes #{seconds} seconds")
        else
          $('#ama-countdown').text("Ama is in session")
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
    value = $(@).parent().find('.upvote-value')
    value.text(data.score)

    if $(@).hasClass('inactive')
      $(@).removeClass('inactive')
      $(@).addClass('active')
      value.css('color', 'white')
    else 
      $(@).removeClass('active')
      $(@).addClass('inactive')
      value.css('color', 'darkgrey')

  showSubmitting: ->
    console.log "blurring"
    $(@).find('textarea').blur()
    $(@).find('.posting').show()



  addComment: (event, data) ->
  	$(@).parents('.user-comment-form').before(data)
  	$(@).parents('.user-comment-form').prev().addClass('animated fadeIn')
  	$(@)[0].reset()
  	
  addReply: (event, data) ->
    $(@).parents('.mentor-reply-form').after(data)
    $(@).find('.posting').hide()
    $(@).parents('.mentor-reply-form').next().addClass('animated fadeIn')
    $(@)[0].reset()


  addQuestion: (event, data) ->
  	$('#questions-sort-bar').after(data)
  	$('.question-thread').first().addClass('animated fadeIn')
  	$(@)[0].reset()
    

ready = ->
  Ama.init()
$(document).ready ready
$(document).on 'page:load', ready
