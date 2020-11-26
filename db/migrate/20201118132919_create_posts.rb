class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :enduser_id
      t.string :post_image_id
      t.text :content
      t.timestamps
    end
  end
end
