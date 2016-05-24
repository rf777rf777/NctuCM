FactoryGirl.define do

	factory :user do
		sequence :name do |n| #按順序(sequence)取名字
			"user_#{n}"
		end
		sequence :email do |n|
			"user_#{n}@example.com"
		end
		password "password" #設定每個用戶的密碼都是password
		password_confirmation "password"
	end

	factory :post do
		user #建立短文的同時建立用戶
		content Faker::Lorem.sentence
	end

	factory :following do #每建立一組關注關係就會建立出相應兩個用戶 還有建立的用戶特別指定用factory: :user(我們設定的用戶建立程式)
		association :from, factory: :user
		association :to,factory: :user
	end
end