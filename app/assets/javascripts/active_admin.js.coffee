#= require jquery
#= require jquery.turbolinks
#= require turbolinks
#= require active_admin/base
#
#= require_self
#
#= require_tree ./active_admin

@controller = (name) -> $("body").hasClass("admin_#{name}")
@action     = (name) -> $("body").hasClass(name)

jQuery ->

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).closest("ol").append($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $("form").on "click", ".remove_fields", (event) ->
    $(this).prev("input[type=hidden]").val("1")
    $(this).closest(".fields").hide()
    event.preventDefault()
