class AddUserSessionToken < ActiveRecord::Migration
  def change
  	add_column :users, :session_token, :string  #增加 :session_token
  	add_index :users, :session_token, unique: true
  end
end
