#= require jquery
#= require active_admin/base
#
#= require_self
#
#= require_tree ./active_admin

@controller = (name) -> $("body").hasClass("admin_#{name}")
@action     = (name) -> $("body").hasClass(name)

jQuery ->

  if $("#page_title").text() == "Markdown"
    $("#utility_nav #markdown").addClass("current")

  $('form').on 'click', '.add_fields', (event) ->
    time = new Date().getTime()
    regexp = new RegExp($(this).data('id'), 'g')
    $(this).closest("ol").append($(this).data('fields').replace(regexp, time))
    event.preventDefault()

  $("form").on "click", ".remove_fields", (event) ->
    $(this).prev("input[type=hidden]").val("1")
    $(this).closest(".attachment-pair").hide()
    event.preventDefault()
