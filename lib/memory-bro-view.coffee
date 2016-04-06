module.exports =
class MemoryBroView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('memory-bro')

    # Create message element
    message = document.createElement('div')
    message.textContent = "The MemoryBro package is Alive! It's ALIVE!"
    message.classList.add('message')
    @element.appendChild(message)

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

   setOutput: (num_mallocs, num_frees) ->
      display_text = "#{num_mallocs} alloc and #{num_frees} frees"
      @element.children[0].textContent = display_text
