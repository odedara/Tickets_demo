class Addidtotickets < ActiveRecord::Migration
  def change
  	add_column :tickets, :category_id, :integer
  end
end
