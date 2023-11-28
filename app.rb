require 'sinatra'
require 'erb'

#Store tasks in an array
tasks = []

#style.css route
get '/styles.css' do
    content_type 'text/css'
    File.read('./views/styles.css')
end

#default route
get '/' do
    @tasks = tasks
    erb :index
end

#add task route
post '/add_task' do
    task = params[:task]
    tasks << { description: task, completed: false } unless task.empty?
    redirect '/'
end

#delete task route
post '/delete_task' do
    task_id = params[:task_id].to_i
    tasks.delete_at(task_id)
    redirect '/'
end

#complete task route
post '/complete_task' do
    task_id = params[:task_id].to_i
    tasks[task_id][:completed] = true
    redirect '/'
end