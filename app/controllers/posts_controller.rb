class PostsController < ApplicationController
  def index
  end
  
  def new
    @post = Post.new
  end
  
  def create
    @post = current_user.posts.new(post_params)
    
    if @post.save
      redirect_to posts_path, success: "投稿されました"
    else
      flash.now[:danger] = "入力内容に誤りがあります"
      render :now
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:content, :description)
  end
  
  def edit
  end
  
  def destroy
  end
end
