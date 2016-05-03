class User < ActiveRecord::Base
	#設定用戶有很多的短文
	has_many :posts, dependent: :destroy

	has_many :out_followings, class_name: "Following" ,foreign_key: :from_id,dependent: :destroy
	has_many :followed_users, class_name: "User" , through: :out_followings,source: :to
	has_many :in_followings, class_name: "Following" , foreign_key: :to_id,dependent: :destroy
	has_many :followers, class_name: "User" , through: :in_followings,source: :from

	
	has_secure_password

	#email在儲存之前全部變小寫(downcase)
	before_save {self.email = email.downcase}
	
	#增加一個before_save的callback (與add_user_session_token.rb中的 :session呼應 所以每當建立一個用戶時系統都會產生token)
	before_save{self.session_token ||= Digest::SHA1.hexdigest(SecureRandom.urlsafe_base64.to_s)}  
	
	validates :name, presence: true, length: {maximum: 30} #設定用戶名稱為必填欄位+長度上限

	validates :email, format: { with: /\A[^@]+@[^@]+\z/ }, uniqueness: {case_sensitive: false }

	def follow(user)  #create a following from self to the user
		out_followings.create(to_id: user.id)
	end

	def unfollow(user)  #unfollow the user by destroying the following from self to user
		following = out_followings.find_by(to_id: user.id)

		if following
			following.destroy
			true
		else
			false
		end		
	end

	def following?(user)  #Is following user?
		followed_users.exists?(user.id)
	end

	def followed_by?(user)
		followers.exists?(user.id)
	end

end
