ajaxHandler = (e) ->
  e.preventDefault()
  post_url = $(this).attr("action")
  form_data = $(this).serialize()
  $.post(post_url, form_data, (response) ->
    $.bootstrapGrowl(response.message,
      offset: {from: "top", amount: 60},
      type: "success"
    )
    ($ ".cart-count").text(response.cart_count)
  )

ajaxCart =
  init: ->
    $ ->
      ($ ".cart-form").on("submit", ajaxHandler)


module.exports = ajaxCart