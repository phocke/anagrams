# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$ ->
  $.template('anagram', $('#anagram-template'))

  

  countTime = (before, after) -> 
    period = after - before 


  $('#search').submit ->
    before = new Date

    $.get(
      $(@).attr('action')
      $(@).serialize()
      (anagramsJSON) -> (
        anagramsJSON['time'] = countTime(before, new Date ) 
        $.tmpl( "anagram", anagramsJSON ).prependTo( "#anagrams" )
        $('#anagram_word').val('')
      )
    )

    false



