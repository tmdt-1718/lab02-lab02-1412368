class ConversationController < ApplicationController
	def index
		@Conversation = current_user.mailbox.conversations
	end
	def show
		@Conversation = current_user.mailbox.conversations.find(params[:id])
	end

	def new
		@receipient = User.all -[current_user]
	end
	def create
		receipient = User.find(params[:user_id])
		receipt = current_user.send_message(recipient, params[:body], params[:subject])
		redirect_to conversation_path(receipt.conversation)
	end

end
