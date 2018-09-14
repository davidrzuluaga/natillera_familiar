class NatilleraController < ApplicationController
  before_action :authenticate_user!

  def index
    @saves = Save.where(user: current_user).order("month ASC")
    @activities = Activity.where(user: current_user).order("date ASC")
    @activitylist = Activitylist.order("date ASC")
    @debt = Debt.where(user: current_user).order("date ASC")
  end

end