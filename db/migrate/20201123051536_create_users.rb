class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.boolean :gender
      t.boolean :is_admin
      t.string :birthday
      t.string :avatar, default: "https://www.gravatar.com/avatar/86b862d65a8e66b9db99136cd16ff394?default=https%3A%2F%2Fcloud.digitalocean.com%2Favatars%2Fdefault1.png&amp;secure=true"
      t.boolean :active
      
      t.timestamps
    end
  end
end
