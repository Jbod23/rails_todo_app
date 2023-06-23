class TodosController < ApplicationController
        before_action :set_todo, only: [:edit, :update, :destroy]
      
        def index
          @todos = Todo.includes(:notes).order('completed ASC, content_updated_at DESC')
        end
      
        def new
          @todo = Todo.new
        end
      
        def create
          @todo = Todo.new(todo_params)
          if @todo.save
            redirect_to todos_path, notice: 'Todo item was successfully created.'
          else
            render :new
          end
        end
      
        def update
          if @todo.update(todo_params)
            redirect_to todos_path, notice: 'Todo item was successfully updated.'
          else
            render :edit
          end
        end

        def show
          @todo = Todo.find(params[:id])
          @notes = @todo.notes
        end
      
        def destroy
          @todo.destroy
          redirect_to todos_path, notice: 'Todo item was successfully destroyed.'
        end

        def clear_all
          Rails.logger.debug "Clear all action called"
          Todo.destroy_all
          redirect_to todos_path, notice: 'All todos have been deleted.'
        end
      
        private
          def set_todo
            @todo = Todo.find(params[:id])
          end
      
          def todo_params
            params.require(:todo).permit(:title, :completed, { tag_ids: [] })
          end
end
      