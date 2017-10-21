class ConversationController < ApplicationController
	before_action :authenticate_user!
	def index
		@Conversation = current_user.mailbox.conversations
	end
	def show
		@Conversation = current_user.mailbox.conversations.find(params[:id])
	end

	def new
		#@receipient = User.all -[current_user]
	end
	def create
		receipient = User.find(params[:user_id])
		receipts = current_user.send_message(receipient, params[:body], params[:subject])
		redirect_to conversation_path(receipts.conversation)
	end

end
