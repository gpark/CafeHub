class AssignmentsController < ApplicationController
  def new
      @assignments_weeks = AssignmentsWeek.order(created_at: :desc).collect {|a| [a.to_s, a.id]}
      @users = User.all.collect {|a| [a.name, a.id]}
      @days = [["Su", "Su"], ["M", "M"], ["Tu", "Tu"], ["W", "W"], ["Th", "Th"], ["F", "F"], ["Sa", "Sa"]]
      @facilities = Facility.all.collect {|a| [a.name, a.id]}
      @times = get_all_times
  end

  def create
      @assignment = Assignment.new
      @assignment.start_time = (params[:start_day] + " " + params[:start_time]).to_hr_form
      @assignment.end_time = (params[:end_day] + " " + params[:end_time]).to_hr_form
      @assignment.assignments_week_id = params[:assignments_week_id]
      @assignment.facility_id = params[:facility_id]
      @assignment.user_id = params[:user_id]
      if @assignment.save
          redirect_to facility_path(@assignment.facility_id, :assignments_week_id => @assignment.assignments_week_id), notice: "Assignment created"
      else
          redirect_to new_assignments_path, alert: "Error creating assignment."
      end
  end

end
