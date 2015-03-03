User =
  init: ->
    $('body').on 'click', '#upload-photo-text', @uploadPhoto

   uploadPhoto: ->
   		$('#user-main form').submit()




ready = ->
  User.init()
$(document).ready ready
$(document).on 'page:load', ready
