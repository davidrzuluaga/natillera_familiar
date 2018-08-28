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
             flash[:success] = "Añadido Satisfactoriamente"
             redirect_to user_path(params[:save][:user_id])
            else
             flash[:danger] = "Falta un campo por llenar"
             redirect_to user_path(params[:save][:user_id])
            end
        else
            redirect_to inicio_path
        end    
    end

    def updateactivity
        if current_user.admin?
            @activity = Activity.new(activity_params)
            if @activity.save
             flash[:success] = "Añadido Satisfactoriamente"
             redirect_to user_path(params[:activity][:user_id])
            else
             flash[:danger] = "Falta un campo por llenar"
             redirect_to user_path(params[:activity][:user_id])
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
