class Removecolumntotickets55 < ActiveRecord::Migration
  def change
  	remove_column :tickets, :status, :boolean
  	add_column :tickets, :status, :boolean, :default => false
  end
end
