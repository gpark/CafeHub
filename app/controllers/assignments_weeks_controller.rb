class AssignmentsWeeksController < ApplicationController
  def new
      @assignments_week = AssignmentsWeek.new

  end

  def create
      @assignments_week = AssignmentsWeek.new(assignments_week_params)
      if @assignments_week.save
          redirect_to assignments_week_path(@assignments_week.id), notice: "Week created"
      else
          redirect_to new_assignments_week_path, alert: "Error creating week."
      end
  end

  def show
    @assignments_week = AssignmentsWeek.find(params[:id])
    @facilities = Facility.all
    @weeks = AssignmentsWeek.order(created_at: :desc).map{|item| [item.to_s, item.id]}
  end

  def index
    if AssignmentsWeek.all.length == 0
      redirect_to new_assignments_week_path, alert: "There are no weeks existing. Please create one."
    elsif params.key?(:chosen_week)
      redirect_to assignments_week_path(params[:chosen_week])
    else
      redirect_to assignments_week_path(AssignmentsWeek.order(:created_at).last.id)
    end
  end

  def assignments_week_params
     params.require(:assignments_week).permit(:start_date, :end_date)
  end
end
