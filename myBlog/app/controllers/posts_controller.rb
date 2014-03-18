class PostsController < ApplicationController

before_filter :authenticate_user!, :except => [:index, :show]

def new

end

def index
  @posts = Post.all
end

def new
  
  @post = Post.new
end

def show
  @post = Post.find(params[:id])
end

def create
  @post = current_user.posts.build(post_params)
  @post.use = current_user
  @post.dat = Date.current()
  @post.save
  redirect_to @post
end

def edit
  
  @post = Post.find(params[:id])
  if(current_user != User.find(@post.use))
    redirect_to Post#index
  end
    
end


def update
  @post = Post.find(params[:id])
  @post.update(params[:post].permit(:title, :entry))
  @post.dat = Date.current()
  redirect_to @post
end

def destroy
  
  @post = Post.find(params[:id])
  if(current_user == User.find(@post.use))
  @post.destroy
  end
  redirect_to posts_path
end

private
  def post_params
    params.require(:post).permit(:title, :entry)
  end

end
