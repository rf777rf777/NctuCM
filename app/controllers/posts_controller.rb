class PostsController < ApplicationController

#before_action :authenticate_user, only: [ :create, :index, :destroy ] #只有建立 短文列表 刪除等action需要用戶登入
  def index
    @posts = Post.from_followed_users(current_user).order("created_at DESC")
  	@post = current_user.posts.build #在index頁面建立一個@post容器 讓我們可以建立短文
  end

  def new
  	@post = current_user.posts.build #我們用current_user.posts.build
  end

  def create
  	@post = current_user.posts.build(create_params)
  	if @post.save
  		flash[:success] = "Posted Successfully"
  		redirect_to posts_path
  	else
  		render "new"
  	end
  end

  def destroy
  	@post = Post.find(params[:id]) #先找到那個短文
  	if current_user?(@post.user) #我們需要用'current_user' 來確認這個用戶就是那個短文的作者
  		@post.destroy #如果認證成功 那就刪除那個短文
  		flash[:success] = "Post deleted"
  		redirect_to posts_path #然後轉至posts#index
  	else  #如果發生錯誤的話
  		flash[:error] = "You cannot delete that post" #顯示一個錯誤訊息
  		redirect_to posts_path  #把用戶傳至posts#index
  	end
  	
  end

  private

  def create_params
  	params.require(:post).permit(:content)
  end
end


