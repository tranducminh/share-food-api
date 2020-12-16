class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :reset_digest
      t.datetime :reset_sent_at
      t.string :gender
      t.boolean :is_admin
      t.string :birthday
      t.string :avatar, default: 'https://redtridentinc.com/wp-content/uploads/2019/08/blank-profile-hi-300x225.png'
      t.boolean :active, default: true
      
      t.timestamps
    end
  end
end
