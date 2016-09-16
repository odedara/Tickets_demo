class Addcolumntotickets < ActiveRecord::Migration
  def change
  	add_column :tickets, :category, :string
  	add_column :tickets, :status, :string
  end
end
