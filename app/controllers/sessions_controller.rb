class SessionsController < ApplicationController

  def new
  end

  def create
      user = User.find_or_create_by(uid: auth['uid']) do |u|
        u.name = auth['info']['name']
      end
      session[:user_id] = user.try(:id)
    end

    def auth
      request.env['omniauth.auth']
    end

end
