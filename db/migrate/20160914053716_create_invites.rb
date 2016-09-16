class CreateInvites < ActiveRecord::Migration
  def change
    create_table :invites do |t|
      t.integer :user_id
      t.integer :ticket_id
      t.string :email

      t.timestamps null: false
    end
  end
end
