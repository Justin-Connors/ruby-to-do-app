require 'sinatra'
require 'erb'

tasks = []

get '/' do
    @tasks = tasks
    erb :index
end

post '/add_task' do
    task = params[:task]
    tasks << task unless task.empty?
    redirect '/'
end

