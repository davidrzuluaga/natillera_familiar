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

    def update
        if current_user.admin?
            @save = Save.new(save_params)
            if @answer.save
             flash[:success] = "Answer posted successfully!"
             redirect_to inicio_path
            else
             flash[:danger] = "The answer can't be blank!"
             redirect_to inicio_path
            end
        else
            redirect_to inicio_path
        end    
    end

end
