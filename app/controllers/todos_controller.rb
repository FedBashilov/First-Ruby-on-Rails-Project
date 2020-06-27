class TodosController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    todo = Todo.new(todo_params)
    if todo.save
        render json: {status: 'SUCCESS', message: 'Saved todo', data: todo}, status: :ok
    else
        render json: {status: 'ERROR', message: 'Todo not saved', data: todo.errors}, status: :unptocessable_entity
    end
  end

  private

  def todo_params
    params.permit(:proj_id, :text, :isCompleted);
  end
end
