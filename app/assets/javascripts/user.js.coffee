User =
	init: ->
		$('body').on 'click', '#upload-photo-text', @uploadPhoto
		$('body').on 'click', '.edit-text', @editText
		$('body').on 'keydown', '.form_in_place input, .form_in_place textarea', @saveOnEnter
		$('body').on 'blur', '.form_in_place input, .form_in_place textarea', @saveFields
		$('body').on 'click', '.background, .user-links', @incrementLinkClickCount
		$('body').on 'ajax:success', '#activation-form', @showActivationStatus

	showActivationStatus: (event, data) ->
		$('.activation-text').text(data.activation_text)

	incrementLinkClickCount: ->
		currentCount = parseInt($(@).attr('data-counter'))
		newCount = currentCount + 1
		userId = $(@).attr('data-user-id')
		$.ajax
			url: "/users/#{userId}?link_click_count=#{newCount}"
			type: "PUT"
			success: (data) ->
				$(@).attr('data-counter', newCount)

	saveFields: ->
		$('.edit-text').text('edit')
		$('.edit-text').attr('style', 'none')


	saveOnEnter: (e) ->
		if e.keyCode == 13
			$(@).parents('.form_in_place').submit()
			$('.edit-text').text('edit')
			$('.edit-text').attr('style', 'none')


	uploadPhoto: ->
		$('#user-main form').submit()


	editText: ->
  	# field = $(@).attr('id').replace('edit', 'user')
  	# console.log $("##{field}")
  	# $("##{field}").click()
		# console.log "Wtf"
		$(@).text('Press Enter to Save')
		$(@).css('color', '#288aff')
		$(@).css('text-decoration', 'underline')






ready = ->
	User.init()
$(document).ready ready
$(document).on 'page:load', ready
