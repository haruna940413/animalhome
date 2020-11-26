class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :enduser_id
      t.integer :pet_id
      t.timestamps
    end
  end
end
