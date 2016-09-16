class Removecolumntotickets < ActiveRecord::Migration
   def up
    remove_column :tickets, :category
  end

  def down
    add_column :tickets, :category, :string
  end
end
