class TodosController < ApplicationController
        before_action :set_todo, only: [:edit, :update, :destroy]
      
        def index
          @todos = Todo.order('completed ASC, content_updated_at DESC')
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
      
        def destroy
          @todo.destroy
          redirect_to todos_path, notice: 'Todo item was successfully destroyed.'
        end
      
        private
          def set_todo
            @todo = Todo.find(params[:id])
          end
      
          def todo_params
            params.require(:todo).permit(:title, :completed)
          end
end
      