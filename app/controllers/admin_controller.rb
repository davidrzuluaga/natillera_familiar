class AdminController < ApplicationController
    before_action :authenticate_user!

    def index
        if current_user.admin?
            @users = User.where(published: true).order("name ASC")
            @ahorrototal = Save.sum(:money)
            @beneficiototal = Activity.sum(:earn)
            @deudatotal = Debt.sum(:money)
            @activitylist = Activitylist.order("date ASC")
            @efectivo = (@ahorrototal+@beneficiototal-@deudatotal)
        else
            redirect_to inicio_path
        end
    end
    
    def show
        if current_user.admin?
            @user = User.find(params[:id])
            @saves = Save.where(user: params[:id]).order("month ASC")
            @activities = Activity.where(user: params[:id]).order("date ASC")
            @activitieslist = Activitylist.all
            @debt = Debt.where(user: params[:id]).order("date ASC")
        else
            redirect_to inicio_path
        end    
    end

    def newdebt
        @debt = Debt.new
    end

    def createdebt
        if current_user.admin?
            @debt = Debt.new(debt_params)
            @debt.user = User.find(params[:id])
            if @debt.save
             flash[:success] = "Añadido Satisfactoriamente"
             redirect_to user_path(params[:id])
            else
             flash[:danger] = "Falta uno o varios campos por llenar"
             redirect_to user_path(params[:id])
            end
        else
            redirect_to inicio_path
        end   
    end

    def modifydebt
        @debt = Debt.find(params[:id])
    end
    
    def updatedebt
        @debt = Debt.update(params[:id], debt_params)
        redirect_to user_path(params[:debt][:user_id])
    end

    def destroydebt
        if current_user.admin?
            @debt = Debt.find(params[:id])
            @debt.destroy
            flash[:success] = "Eliminado"
            redirect_to user_path(@debt.user_id)                
        else
            redirect_to inicio_path
        end    
    end
    
    def newsave
        @save = Save.new
    end

    def createsave
        if current_user.admin?
            @save = Save.new(save_params)
            @save.user = User.find(params[:id])
            if @save.save
             flash[:success] = "Añadido Satisfactoriamente"
             redirect_to user_path(params[:id])
            else
             flash[:danger] = "Falta uno o varios campos por llenar"
             
             redirect_to user_path(params[:id])
            end
        else
            redirect_to inicio_path
        end    
    end
    
    def modifysave
        @save = Save.find(params[:id])
    end
    
    def updatesave
        @save = Save.update(params[:id], save_params)
        redirect_to user_path(params[:save][:user_id])
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

    def newactivity
        @activity = Activity.new
    end
   
    def createactivity
        if current_user.admin?
            @activity = Activity.new(activity_params)
            @activity.user = User.find(params[:id])
            if @activity.save
             flash[:success] = "Añadido Satisfactoriamente"
             redirect_to user_path(params[:id])
            else
                flash[:danger] = "Falta uno o varios campos por llenar"
             redirect_to user_path(params[:id])
            end
        else
            redirect_to inicio_path
        end    
    end
    
    def modifyactivity
        @activity = Activity.find(params[:id])
    end
    
    def updateactivity
        @activity = Activity.update(params[:id], activity_params)
        redirect_to user_path(params[:activity][:user_id])
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

    def debt_params
        params.require(:debt).permit(:date, :money, :note, :user_id)
    end

    def save_params
        params.require(:save).permit(:month, :money, :note, :user_id)
    end

    def activity_params
        params.require(:activity).permit(:date, :earn, :activity, :note, :user_id, :activitylist_id )
    end

    def activity_list_params
        params.require(:activitylist).permit(:date, :person, :name)
    end
end
