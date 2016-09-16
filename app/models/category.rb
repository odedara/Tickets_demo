class Category < ActiveRecord::Base
	has_many :tickets, dependent: :destroy
end
