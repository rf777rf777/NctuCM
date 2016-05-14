class Post < ActiveRecord::Base

	#可用sunspot搜尋內容 也要能搜尋作者名字或email
	#所以要做關連性設定
	searchable do
		text :content
		text :user do
			[user.name,user.email]
		end
	end

  	belongs_to :user

  	validates :user_id, presence: true
  	validates :content, presence: true, length: {maximum: 200} #設定用戶名稱為必填欄位+長度上限

	def self.from_followed_users(user)
		where(" user_id IN (SELECT to_id FROM followings WHERE from_id = :user_id) OR user_id = :user_id", user_id: user)		
	end
end
