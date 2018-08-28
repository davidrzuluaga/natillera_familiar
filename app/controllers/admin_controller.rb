class AdminController < ApplicationController
    before_action :authenticate_user!

    def index
        if current_user.admin?
            @users = User.all
        else
            redirect_to inicio_path
        end
    end

    def show
        if current_user.admin?
            @user = User.find(params[:id])
            @saves = Save.where(user: params[:id])
            @activities = Activity.where(user: params[:id])
        else
            redirect_to inicio_path
        end    
    end

    def updatesave
        if current_user.admin?
            
            @save = Save.new(save_params)
            if @save.save
             flash[:success] = "Answer posted successfully!"
             redirect_to inicio_path
            else
             flash[:danger] = "The answer can't be blank!"
            end
        else
            redirect_to inicio_path
        end    
    end

    def updateactivity
        if current_user.admin?
            @activity = Activity.new(activity_params)
            if @activity.save
             flash[:success] = "Answer posted successfully!"
             redirect_to inicio_path
            else
             flash[:danger] = "The answer can't be blank!"
             binding.pry
            end
        else
            redirect_to inicio_path
        end    
    end

private

    def save_params
        params.require(:save).permit(:month, :money, :note, :user_id)
    end

    def activity_params
        params.require(:activity).permit(:date, :earn, :activity, :note, :user_id)
    end

end
