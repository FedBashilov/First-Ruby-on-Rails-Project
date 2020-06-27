class ProjectsController < ApplicationController
  skip_before_action :verify_authenticity_token
  def index
    projects = Project.order('id');
    render json: {status: 'SUCCESS', message: 'Loaded projects', data: projects}, status: :ok
  end

  def update
    project = Project.find(params[:proj_id]);
    if project
      todo = Todo.find(params[:todo_id]);
      if todo.update_attributes(patch_params)
        render json: {status: 'SUCCESS', message: 'Patch todo', data: todo}, status: :ok
      else
        render json: {status: 'ERROR', message: 'Todo not patched', data: todo.errors}, status: :unptocessable_entity
      end
    end
  end

  private

  def patch_params
    params.permit(:isCompleted)
  end
end
