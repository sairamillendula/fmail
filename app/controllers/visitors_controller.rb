class VisitorsController < ApplicationController
  def index
    if current_user.present?
      redirect_to '/users'
    end
  end
end
