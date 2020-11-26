class CreatePets < ActiveRecord::Migration[5.2]
  def change
    create_table :pets do |t|
      t.integer :genre_id
      t.string :name
      t.string :animal_image_id
      t.string :kind
      t.string :detail
      t.integer :age, default: 0, null: false
      t.integer :sex, default: 0, null: false
      t.integer :size, default: 0, null: false
      t.integer :prefectures, default: 0, null: false
      t.integer :vaccine_status, default: 0, null: false
      t.integer :castration_status, default: 0, null: false
      t.integer :single_status, default: 0, null: false
      t.integer :older_status, default: 0, null: false
      t.integer :pet_status, default: 0, null: false
      t.timestamps
    end
  end
end
