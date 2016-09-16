class TicketsController < ApplicationController
before_action :authenticate_user!
load_and_authorize_resource
	def new
		@ticket = Ticket.new
	end

	def index

			where = ""
      where += "title LIKE '#{params[:search]}'" if !params[:search].blank?
      cond = (!where.blank?) ? " AND " : ""
      where += " #{cond} category_id = #{params[:category_id]}" if !params[:category_id].blank?
      cond = (!where.blank?) ? " AND " : ""
      where += " #{cond} user_id = #{current_user.id}" if !current_user.admin?

     
		if current_user.admin?
			if where.blank?
			
				@tickets = Ticket.all
			else
				@tickets=Ticket.where(where)
			end
		else
    		@tickets=Ticket.where(where)
		end
	@invited_tiket = Invite.where(email: current_user.email).pluck(:ticket_id)
    		#abort @invited_tiket.inspect
    		@invited_tikets = Ticket.where('id in (?)', @invited_tiket)
  	end

	def create
		@ticket = Ticket.new(ticket_params)
 
  		@ticket .save
  		redirect_to @ticket 
	end

	def show
		
    	@ticket = Ticket.find(params[:id])
  	end

  	def edit
  		@ticket = Ticket.find(params[:id])
	end

	def destroy
	  @ticket = Ticket.find(params[:id])
	  @ticket.destroy
	 
	  redirect_to tickets_path
	end

	def update
  		@ticket = Ticket.find(params[:id])
 
  		if @ticket.update(ticket_params)
    		redirect_to @ticket
  		else
    		render 'edit'
  		end
	end

	# def check_email
	#     @user = User.find_by_email(params[:user][:email])
	 
	#     respond_to do |format|
	#     format.json { render :json => !@user }
	#     end
	# end

	def change_status
		@ticket = Ticket.find(params[:id])

		@ticket.update_attributes(:status => params[:status])
		UserMailer.status_mail(@ticket, @ticket.user.email).deliver
		
		render nothing: true
	end

	def invite_user
		@invite = Invite.new
	end

	def send_invite
		@invite = Invite.create(:email => params[:invite][:email], :user_id => current_user.id, :ticket_id => params[:invite][:ticket_id])

	
		UserMailer.invitation_mail(@invite, current_user.email).deliver
		redirect_to tickets_path

	
	end

	private
	def ticket_params
		params.require(:ticket).permit(:title, :description, :status, :category_id).merge!(user_id: current_user.id)
	end

end
