class UsersController < ApplicationController
  before_filter :authenticate_user!
  before_filter :correct_user?, :except => [:index]

  def index
    @users = User.all
    @graph = Koala::Facebook::GraphAPI.new(current_user.token)
    @inbox = @graph.get_connections("me", "inbox")
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update_attributes(secure_params)
      redirect_to @user
    else
      render :edit
    end
  end

  def show
    @user = User.find(params[:id])
  end

  private

  def secure_params
    params.require(:user).permit(:email)
  end

  def get_user_info(user_id)
    return @graph.get_picture(user_id)
  end

  def get_awesome_date(bad_datetime)
    now = Time.now
    bad_datetime = Time.parse(bad_datetime).localtime
    if (bad_datetime.strftime("%Y-%m-%d") == now.strftime("%Y-%m-%d") )
        today = "Today " + bad_datetime.strftime("%l:%M%p")
        return today 
    else
        regular = bad_datetime.strftime("%d %b")
        return regular
    end
  end
  helper_method :get_user_info, :get_awesome_date
end