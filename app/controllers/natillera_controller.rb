class NatilleraController < ApplicationController
  before_action :authenticate_user!

  def index
    @saves = Save.find_by(user: current_user)
  end
end
