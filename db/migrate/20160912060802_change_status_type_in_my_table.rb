class ChangeStatusTypeInMyTable < ActiveRecord::Migration
  def change
  	change_column :tickets, :status, :boolean
  end
end
