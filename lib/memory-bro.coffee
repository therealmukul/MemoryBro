MemoryBroView = require './memory-bro-view'
{CompositeDisposable} = require 'atom'

module.exports = MemoryBro =
   memoryBroView: null
   modalPanel: null
   subscriptions: null

   activate: (state) ->
      @memoryBroView = new MemoryBroView(state.memoryBroViewState)
      @modalPanel = atom.workspace.addModalPanel(item: @memoryBroView.getElement(), visible: false)

      # Events subscribed to in atom's system can be easily cleaned up with a CompositeDisposable
      @subscriptions = new CompositeDisposable

      # Register command that toggles this view
      @subscriptions.add atom.commands.add 'atom-workspace', 'memory-bro:toggle': => @toggle()

   deactivate: ->
      @modalPanel.destroy()
      @subscriptions.dispose()
      @memoryBroView.destroy()

   serialize: ->
      memoryBroViewState: @memoryBroView.serialize()

   toggle: ->
      console.log 'MemoryBro was toggled!'

      if editor = atom.workspace.getActiveTextEditor()
         text = editor.getText()
         text_array = text.split("\n")
         # console.log(text_array)

         malloc_count = 0
         free_count = 0

         for word, index in text_array
            if /malloc(...)/.test(word) and not /\/\//.test(word)  # malloc() is found
               prev_line = index - 1

               # Check to see if malloc() is embedded in a 'for loop'
               if /(for \()/.test(text_array[prev_line])
                  line_array = text_array[prev_line].split(" ")  # split text buffer by space
                  num_iter = -1
                  start_iter = -1
                  for item, i in line_array
                     if line_array[i] == "="
                        start_iter_loc = i + 1
                        start_iter = parseInt(line_array[start_iter_loc], 10)
                        console.log "Start Iter = " + start_iter

                     if line_array[i] == "<"
                        iter_loc = i + 1
                        if /[a-z]/.test(line_array[iter_loc])
                           console.log "Is variable: " + line_array[iter_loc]
                        else
                           num_iter = parseInt(line_array[iter_loc], 10)
                           console.log "Num iter =  " + num_iter;

                     if line_array[i] == "<="
                        iter_loc = i + 1
                        num_iter = parseInt(line_array[iter_loc], 10) + 1
                        console.log "Num iter =  " + num_iter;
                  malloc_count = malloc_count + (num_iter - start_iter)

               else
                  malloc_count = malloc_count + 1



         console.log "#{malloc_count} malloc(...)"
         console.log "#{free_count} free(...)"

         if @modalPanel.isVisible()
            @modalPanel.hide()
         else
            @memoryBroView.setOutput(malloc_count, free_count)
            @modalPanel.show()
