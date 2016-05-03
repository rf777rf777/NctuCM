class SessionsController < ApplicationController
  def new
  end

  def create
  	#用session裡面的email資料找到用戶
  	@user = User.find_by_email(params[:session][:email])

  	#如果找到用戶且密碼正確 即登入
  	if @user && @user.authenticate(params[:session][:password])
  		
  		#因為將SessionsHelper include進ApplicationController內(application_controller.rb)
  		#所以將以下此手寫功能替換掉
  		#session[:session_token] = @user.session_token
  		sign_in(@user)

  		flash.now[:success] = "Welcome back,#{@user.name}!"
  		redirect_to @user
  	else
  		#flash.now會在flash的hash執行過一次之後把這個hash清除掉 
  		#(防止登入成功後出現錯誤訊息)
  		flash.now[:error] = "Invalid email/password combination"
  		render "new"
  	end
  end

  def destroy
  	sign_out
  	redirect_to root_path
  end
end
