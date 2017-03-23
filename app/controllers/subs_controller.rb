class SubsController < ApplicationController
  authorize_resource

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
          @assignments = @assignments.includes(:sub).where({assignments_week_id: @assignments_week.id}).where(subs: {id: nil}).map{|item| [item.to_s, item.id]}
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
    if params.key?(:chosen_week)
      @chosen_week = params[:chosen_week]
    else
      @chosen_week = @weeks[0][1]
    end
    @subs = Sub.where({assignments_week_id: @chosen_week})
  end

  def sub_params
    params.require(:sub).permit(:comments, :created_at, :updated_at, :assignment_id)
  end

  def update
    sub = Sub.find(params[:sub_id])
    assignment = Assignment.find(sub.assignment_id)
    assignment.user_id = current_user.id
    assignment.sub = nil
    facility = assignment.facility.name
    start_time = assignment.start_time.to_timestring
    end_time = assignment.end_time.to_timestring
    if assignment.save
      Sub.delete(params[:sub_id])
      redirect_to root_path, notice: "You have taken the assignment for " + facility + " from " + start_time + " to " + end_time + "."
    else
      redirect_to subs_path, alert: "There was an error in taking the sub."
    end
  end
  
end
