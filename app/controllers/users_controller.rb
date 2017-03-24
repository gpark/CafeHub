class UsersController < ApplicationController

  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def all
    @users = User.all
    render 'all'
  end

  def assignments
    @weeks = AssignmentsWeek.order(created_at: :desc).map{|item| [item.to_s, item.id]}
    @chosen_week = get_chosen_week(@weeks, params)
    @assignments = User.find(params[:id]).assignments.where({assignments_week_id: @chosen_week})
  end

  def privileges
    if not current_user.admin?
      raise CanCan::AccessDenied.new
    end

    if params[:confirm].to_s != Setting.sign_up_code.to_s
      redirect_to users_all_path, alert: "Wrong code"
    elsif params[:tag_ids].nil?
      redirect_to users_all_path
    else
      for tag_id in params[:tag_ids] do
        user = User.find(tag_id)
        user.admin = true
        user.save!
      end
      redirect_to users_all_path, notice: "Admins updated"
    end
  end

end
