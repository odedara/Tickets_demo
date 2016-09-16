class Ticket < ActiveRecord::Base
	belongs_to :category
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :invites
	validates :title, :category, presence: true,
                    length: { minimum: 5 }


#     def self.search(search)
    	
#   if search
#     @tickets=Ticket.where('title LIKE ?', "%#{search}%")
#   else
#     @tickets=Ticket.all
#   end
# end
end


