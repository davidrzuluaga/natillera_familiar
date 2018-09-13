class AdminController < ApplicationController
    before_action :authenticate_user!

    def index
        if current_user.admin?
            @users = User.where(published: true).order("name ASC")
            @ahorrototal = Save.sum(:money)
            @beneficiototal = Activity.sum(:earn)
            @activitylist = Activitylist.order("date ASC")
        else
            redirect_to inicio_path
        end
    end
    
    def show
        if current_user.admin?
            @user = User.find(params[:id])
            @saves = Save.where(user: params[:id]).order("month ASC")
            @activities = Activity.where(user: params[:id]).order("date ASC")
            @activitieslist = Activitylist.all.map { |act| [act.name]}
            @activity = Activity.new
        else
            redirect_to inicio_path
        end    
    end

    def updatesave
        if current_user.admin?
            @save = Save.new(save_params)
            if @save.save
             flash[:success] = "Añadido Satisfactoriamente"
             redirect_to inicio_path#user_path(params[:save][:user_id])
            else
             flash[:danger] = "Falta uno o varios campos por llenar"
             
             redirect_to inicio_path#user_path(params[:save][:user_id])
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
             redirect_to inicio_path # user_path(params[:activity][:user_id])
            else
             flash[:danger] = "Falta uno o varios campos por llenar"
             
             redirect_to inicio_path # user_path(params[:activity][:user_id])
            end
        else
            redirect_to inicio_path
        end    
    end

    def destroyactivity
        if current_user.admin?
            @activity = Activity.find(params[:id])
            @activity.destroy
            flash[:success] = "Eliminado"
            redirect_to user_path(@activity.user_id)
        else
            redirect_to inicio_path
        end    
    end

    def modifyactivity
        @activity = Activity.find(params[:id])
    end

    def modifysave
        @save = Save.find(params[:id])
    end

    def updatemodsave
        @save = Save.update(params[:id], save_params)
    end

    def newsave
        @save = Save.new
    end

    def destroysave
        if current_user.admin?
            @save = Save.find(params[:id])
            @save.destroy
            flash[:success] = "Eliminado"
            redirect_to user_path(@save.user_id)
        else
            redirect_to inicio_path
        end    
    end

    def createactivitylist
        if current_user.admin?
            @activitylist = Activitylist.new(activity_list_params)
            if @activitylist.save
             flash[:success] = "Añadido Satisfactoriamente"
             redirect_to admin_path
            else
             flash[:danger] = "Falta uno o varios campos por llenar"
             redirect_to admin_path
            end
        else
            redirect_to inicio_path
        end    
    end

    def destroyactivitylist
        if current_user.admin?
            @activitylist = Activitylist.find(params[:id])
            @activitylist.destroy
            flash[:success] = "Eliminado"
            redirect_to admin_path
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

    def activity_list_params
        params.require(:activitylist).permit(:date, :person, :name)
    end
end
