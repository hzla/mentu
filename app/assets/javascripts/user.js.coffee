User =
  init: ->
    

ready = ->
  User.init()
$(document).ready ready
$(document).on 'page:load', ready
