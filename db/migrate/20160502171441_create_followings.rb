class CreateFollowings < ActiveRecord::Migration
  def change
    create_table :followings do |t|
      t.references :from, index: true#, foreign_key: true
      t.references :to, index: true#, foreign_key: true

      t.timestamps null: false
    end

    #一個用戶不能重複關注另一個用戶
    add_index :followings, [ :from_id, :to_id ], unique: true
  end
end
