Rails.application.routes.draw do
  resources:projects
  patch 'projects/:proj_id/todo/:todo_id' => 'projects#update'
  resources:todos
end
