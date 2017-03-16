class SubsController < ApplicationController

  def new
      @weeks = AssignmentsWeek.order(created_at: :desc).map{|item| [item.to_s, item.id]}
      if params.key?(:chosen_week)
        @assignments_week = AssignmentsWeek.find(params[:chosen_week])
      else
        @assignments_week = AssignmentsWeek.find(@weeks[0][1])
      end
      @sub = Sub.new
      @assignments = current_user.assignments
      if !@assignments.empty?
          @assignments = @assignments.where("assignments_week_id = ?", @assignments_week.id.to_s).where.not(id: Sub.joins(:assignment)).map{|item| [item.to_s, item.id]}
      end
  end

  def create
      @sub = Sub.new(sub_params)
      @sub.assignments_week = @sub.assignment.assignments_week
      if @sub.save
          redirect_to subs_path, notice: "Sub created"
      else
          redirect_to new_subs_path, alert: "Sub not created"
      end
  end

  def index
    @weeks = AssignmentsWeek.order(created_at: :desc).map{|item| [item.to_s, item.id]}
    @chosen_week =
    @subs = Sub.where({assignments_week: AssignmentsWeek.find(@chosen_week)})
  end

  def sub_params
    params.require(:sub).permit(:comments, :created_at, :updated_at, :assignment_id)
  end

end
