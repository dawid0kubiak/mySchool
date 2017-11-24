class MessagesController < ApplicationController
  before_action :set_message, only: [:show, :edit, :update, :destroy]
  # before_action :set_recipient, only: [:index, :new, :create]

  # GET /messages
  # GET /messages.json
  def index
    @message = Message.new
    @messages = current_user.messages.where(deleted: false)
    @type = :inbox
    @countmessages = current_user.messages.where(unread: true, deleted: false).count
    case params[:type]
      when 'sent'
        @type = :sent
        @messages = current_user.sent_messages.where(deleted: false)
      when 'trash'
        @type = :trash
        @messages = current_user.messages.where(deleted: true) && current_user.sent_messages.where(deleted: true)
    end
    authorize @messages
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @comment = Comment.new
  end

  def create_comment
    message = current_user.find_messages.find(params[:message_id])
    message.comments.create(comment_params)
    authorize message
    redirect_to message_path message
  end

  # GET /messages/new
  def new
    @message = Message.new
    authorize @message
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = current_user.sent_messages.new(message_params)
    authorize @message

    respond_to do |format|
      if @message.save
        format.html {redirect_to @message, notice: 'Utworzono wiaddomość.'}
        format.json {render :show, status: :created, location: @message}
      else
        format.html {render :new}
        format.json {render json: @message.errors, status: :unprocessable_entity}
      end
    end
  end

  def update
    respond_to do |format|
      if @message.update(message_params)
        format.html {redirect_to @message, notice: 'Zmieniono status wiadomości.'}
      else
        format.html {redirect_to @message, notice: 'Nie udało się zmienić statusu wiadomości.'}
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message.destroy
    respond_to do |format|
      format.html {redirect_to messages_url, notice: 'Message was successfully destroyed.'}
      format.json {head :no_content}
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_message
    @message = Message.find(params[:id])
    authorize @message
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def message_params
    params.require(:message).permit(:title, :body, :recipient_id, :unread, :deleted)
  end

  def comment_params
    params.require(:comment).permit(:title, :body, :recipient_id)
  end

  def set_recipient
    @recipient = User.find params[:user_id]
  end
end
