class AvatarsController < ApplicationController
  before_filter   :get_resources

  def index
    @avatars = @user.avatars.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @avatars }
    end
  end

  def show

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @avatar }
    end
  end

  def new
    @avatar = @user.avatars.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @avatar }
    end
  end

  def edit
  end

  def create
    @avatar = @user.avatars.new(avatar_params)

    respond_to do |format|
      if @avatar.save
        format.html { redirect_to user_avatars_path(@user), notice: 'Avatar was successfully created.' }
        format.json { render json: @avatar, status: :created, location: @avatar }
      else
        format.html { render action: "new" }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  def update

    respond_to do |format|
      if @avatar.update_attributes(avatar_params)
        format.html { redirect_to user_avatars_path(@user), notice: 'Avatar was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @avatar.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @avatar.destroy

    respond_to do |format|
      format.html { redirect_to user_avatars_path(@user) }
      format.json { head :no_content }
    end
  end

  private

    def get_resources
      @user ||= User.find(params[:user_id]) if params[:user_id]

      if @user
        @avatar = @user.avatars.find(params[:id]) if params[:id]
      else
        @avatar = Avatar.find(params[:id]) if params[:id]
        @user = @avatar.user
      end
    end

    def avatar_params
      params.require(:avatar).permit(:active, :location, :name, :signature, :title, :user_id, :image)
    end
end
