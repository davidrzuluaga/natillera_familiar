class NatilleraController < ApplicationController
  before_action :authenticate_user!

  def index
    @saves = Save.where(user: current_user)
    @activities = Activity.where(user: current_user)
  end

end