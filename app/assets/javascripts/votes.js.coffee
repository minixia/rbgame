# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
jQuery ->
  $("#red").on 'click', ->
    $('#vote').attr('value', '红')
  $("#black").on 'click', ->
    $('#vote').attr('value', '黑')
  if($('#wait').length > 0)
    refresh = ()->
      setInterval ->
        local = window.location.href + ".json"
        $.get local, {}, (data, status)->
          if(data.score)
            window.location.href = window.location.href
      , 1000
    refresh()

  if($('.countdown').length > 0)
    countdown = ()->
      setInterval ->
        $c = $('.countdown')
        second = parseInt($c.text())
        if(second > 0)
          $c.text(second - 1)
        else
          $c.text('请投票')
          return false
      , 1000
    countdown()

  if($('#next_vote').length > 0)
    $('#next_vote').on 'click', ->
      window.location = "/votes/new?team=" + $('#team').attr('value') + "&game_id=" + $('#gid').attr('value')

  return null