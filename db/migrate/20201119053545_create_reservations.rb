class CreateReservations < ActiveRecord::Migration[5.2]
  def change
    create_table :reservations do |t|
      t.integer :enduser_id
      t.datetime :start_date 
      t.timestamps
    end
  end
end
