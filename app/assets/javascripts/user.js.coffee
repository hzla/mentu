User =
  init: ->
    $('body').on 'click', '.edit-text', @editField

  editField: ->
  	field = $(@).attr('id').replace('edit', 'user')
  	console.log $("##{field}")
  	$("##{field}").click()


ready = ->
  User.init()
$(document).ready ready
$(document).on 'page:load', ready
