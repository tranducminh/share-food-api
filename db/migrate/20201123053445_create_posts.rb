class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :title
      t.string :food_name
      t.boolean :is_confirm
      t.string :image
      t.string :content
      t.boolean :active
      
      t.references :user, null: false, foreign_key: true
      t.references :country, null: false, foreign_key: true
      t.references :food_type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
