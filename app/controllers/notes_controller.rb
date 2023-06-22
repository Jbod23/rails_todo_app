class NotesController < ApplicationController
    def create
        @todo = Todo.find(params[:todo_id])
        @note = @todo.notes.create(note_params)
        redirect_to todo_path(@todo)
      end
      
      private

      def note_params
        params.require(:note).permit(:content)
      end
      
end
