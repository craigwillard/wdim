class MessagesController < ApplicationController
  before_filter   :get_resources

  def index
    if @user
      @messages = @user.messages.all
    else
      @messages = Message.all
    end


    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @messages }
    end
  end

  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  def new
    @message = @user.messages.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  def edit
  end

  def create
    @message = @user.messages.new(message_params)

    respond_to do |format|
      if @message.save
        format.html { redirect_to @message, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @message.update_attributes(message_params)
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @message.destroy

    respond_to do |format|
      format.html { redirect_to messages_url }
      format.json { head :no_content }
    end
  end

  private

    def get_resources
      @user ||= User.find(params[:user_id]) if params[:user_id]

      if @user
        @message = @user.messages.find(params[:id]) if params[:id]
      else
        @message = Message.find(params[:id]) if params[:id]
        @user = @message.user if @message
      end
    end

    def message_params
      params.require(:message).permit(:body, :date, :last_post_date, :last_post_id, :old_id, :reply_count, :title, :user_id)
    end
end
