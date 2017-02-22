class UsersController < ApplicationController

  def index
    if !user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def destroy
    if not current_user.admin?
      raise CanCan::AccessDenied.new
    end

    assignment = Assignment.find(params[:assignment_id])
    user = assignment.user_id
    week_id = assignment.assignments_week_id
    assignment.destroy
    flash[:notice] = "Assignment deleted."
    redirect_to :controller => 'users', :action => 'assignments', :id => user, :assignments_week_id => week_id
  end

  def all
    @users = User.all
    render 'all'
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
