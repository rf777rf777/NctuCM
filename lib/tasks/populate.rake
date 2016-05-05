namespace :db do
	desc "Generate users"
	task populate: :environment do
		# 產生fixed users:FakeA FakeB
		FakeA = User.create!(name: "TestMan1" ,email: "test1@test.com.tw", password:"test",password_confirmation: "test")
		FakeB = User.create!(name: "TestMan2" ,email: "test2@test.com.tw", password:"test",password_confirmation: "test")

		#產生98個隨機使用者
		users = [FakeA,FakeB]
		users += 98.times.collect do |i|
			name = "#{Faker::Name.first_name}#{i}"
			email = "#{name}@example.com"
			password = Faker::Internet.password
			user = User.create!(name: name ,email: email, password: password,password_confirmation: password)
		end

		#亂數(Randomize)產生使用者的建立時間 - Randomize user created_at timestamp
		users.each { |user| user.update!(created_at: Date.today - rand(30)) }

		#產生PO文(posts)
		posts = (10*users.count).times.collect do
			users.sample.posts.create!(content: Faker::Lorem.sentence)
		end

		#產生關注的人(followings) (自動產生關注關係)
		followings = (5*users.count).times.collect do
			from = users.sample
			to = users.sample
			from.follow(to) unless from == to || from.following?(to)
		end
	end
end