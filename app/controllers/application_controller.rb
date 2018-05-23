
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/posts/new' do
    erb :new
  end



  post '/posts' do
    name = params[:name]
    content = params[:content]
    Post.create(:name => name, :content => content)
    redirect to '/posts'
  end

  get '/posts' do
    @posts = Post.all
    erb :index
  end

  get '/posts/:id' do
    @post = Post.find(params[:id].to_i)

    erb :show
  end

  get '/posts/:id/edit' do

    @post = Post.find(params[:id].to_i)
    erb :edit
  end

  patch '/posts/:id' do
    @post = Post.find(params[:id])
    binding.pry
    @post.update(params[:name])
    @post.update(params[:content])

    erb :show
  end


end
