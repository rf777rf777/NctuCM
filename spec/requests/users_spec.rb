#測試users#index頁面有無辦法開啟
require 'spec_helper'

describe "Users" do #我們的測試要針對users(用戶資料)
  describe "GET /users" do #我們要測試的頁面是users#index
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get users_path #用HTTP GET模式試試看訪問users#index
      response.status.should be(200) #返回值應該要是HTTP code 200 (頁面沒問題的意思)
    end
  end

  describe "POST /users" do
  	it "registers" do #能不能註冊
  	end

  	it "does not allow blank name" do #名字不能為空白
  	end

  	it "does not allow duplicate email" do #不能有重複的email
  	end

  	it "does not allow incorrect email format" do #必須有正確的email格式
  	end

  	it "does not allow mis-match password and password confirmation" do #不能允許密碼確認錯誤
  	end
  end

  describe "GET /users/1" do
  	it "redirects to sign-in" do #可以轉送到登入頁面
  	end

  	it "shows" do #確定可以顯示頁面
  	end
  end

  describe "GET /users" do
  	it "redirects to sign-in" do #可以轉送到登入頁面
  	end

  	it "indexes" do #可以成功建立index索引值
  	end

  	it "searches names" do #可以搜尋用戶
  	end
  end

  describe "GET /users/1/followers" do
  	it "redirects to sign-in" do #可以轉送到登入頁面
	end

	it "list" do #可以列出被關注用戶資料
	end
  end

  describe "POST /users/1/follow", js: true do #可以關注
  	it "follows" do
  	end
  end

  describe "DELETE /users/1/unfollow" ,js: true do #可以取消關注
  	it "unfollows" do
  	end
  end

  describe "GET /users/1/followings" do
  	it "redirects to sign-in" do #可以轉送到登入頁面
  	end

  	it "lists" do
  	end
  end
end
