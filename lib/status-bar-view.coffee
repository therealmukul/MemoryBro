module.exports =
class StatusBarView
  constructor: ->
    @element = document.createElement 'div'
    @element.classList.add("memory-bro-status","inline-block")

  # function to update status bar content.
  updateMem: () ->
    #use output from memory-bro-view to put status on bottom bar


  getElement: =>
    @element

  removeElement: =>
    @element.parentNode.removeChild(@element)
    @element = null
