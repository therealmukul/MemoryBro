module.exports =
class MemoryBroView
  constructor: (serializedState) ->
    # Create root element
    @element = document.createElement('div')
    @element.classList.add('memory-bro')

  # Returns an object that can be retrieved when package is activated
  serialize: ->

  # Tear down any state and detach
  destroy: ->
    @element.remove()

  getElement: ->
    @element

   setOutput: (num_mallocs, num_frees, malloc_info, free_info) ->
      # Create message element
      message = document.createElement('div')
      message.textContent = "#{num_mallocs} alloc and #{num_frees} frees"
      message.classList.add('message')
      @element.appendChild(message)

      for m_info in malloc_info
         line = m_info[0] + 1
         num_allocs = m_info[1]
         console.log "Line: #{line}, Number allocations: #{num_allocs}"

         x = document.createElement("UL");
         x.setAttribute("id", "myUL");
         @element.appendChild(x)

         y = document.createElement("LI");
         t = document.createTextNode("Line: #{line}, Number allocations: #{num_allocs}");
         y.appendChild(t);
         document.getElementById("myUL").appendChild(y);

      for f_info in free_info
         line = f_info[0] + 1
         num_free = f_info[1]
         console.log "Line: #{line}, Number de-allocations: #{num_free}"

         x = document.createElement("UL");
         x.setAttribute("id", "myUL");
         @element.appendChild(x)

         y = document.createElement("LI");
         t = document.createTextNode("Line: #{line}, Number de-allocations: #{num_free}");
         y.appendChild(t);
         document.getElementById("myUL").appendChild(y);


   clearDOM: ->
      while (@element.hasChildNodes())
         @element.removeChild(@element.lastChild);
