class FacebookController < ApplicationController
  def setup
    request.env['omniauth.strategy'].options[:scope] =  'xmpp_login, read_mailbox'
    render :text => "Setup complete.", :status => 404
  end
end