User =
  init: ->
    $('body').on 'click', '.edit-text', @editField
    $('body').on 'click', '#upload-photo-text', @uploadPhoto

   uploadPhoto: ->
   		$('#user-main form').submit()

  editField: ->
  	field = $(@).attr('id').replace('edit', 'user')
  	console.log $("##{field}")
  	$("##{field}").click()


ready = ->
  User.init()
$(document).ready ready
$(document).on 'page:load', ready
