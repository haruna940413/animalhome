class CreateInquiries < ActiveRecord::Migration[5.2]
  def change
    create_table :inquiries do |t|
      t.string :name
      t.string :email
      t.string :message
      t.boolean :reply_status, default: false
      t.timestamps
    end
  end
end
