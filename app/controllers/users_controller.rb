class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    @users = User.all
    @graph = Koala::Facebook::GraphAPI.new(current_user.token)
    @inbox = @graph.get_connections("me", "inbox")
  end

  def compose
    @users = User.all
    @graph = Koala::Facebook::GraphAPI.new(current_user.token)
  end

  def message
    @users = User.all
    @graph = Koala::Facebook::GraphAPI.new(current_user.token)
    @message = @graph.get_object(params[:id])
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
        today = bad_datetime.strftime("%l:%M %p")
        return today 
    elsif (bad_datetime.strftime("%Y-%m-%d") == ((now - 1.day).strftime("%Y-%m-%d")))
        return "Yesterday"
    else
        regular = bad_datetime.strftime("%d %b")
        return regular
    end
  end

  def get_read_class(status)
    if (status != "0")
      return "gray-border"
    else
      return "blue-border"
    end
  end

  def mail_merge()
    id = '-100000078227649@chat.facebook.com'
    to = '-642642467@chat.facebook.com'
    body = "A16Z Hack"
    subject = 'Sent from FMail'
    message = Jabber::Message.new to, body
    message.subject = subject

    client = Jabber::Client.new Jabber::JID.new(id)
    client.connect
    client.auth_sasl(Jabber::SASL::XFacebookPlatform.new(client, ENV["OMNIAUTH_PROVIDER_KEY"], current_user.token, ENV["OMNIAUTH_PROVIDER_SECRET"]), nil)
    client.send message
    client.close
  end

  helper_method :get_user_info, :get_awesome_date, :get_read_class, :mail_merge
end