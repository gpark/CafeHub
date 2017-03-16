class FacilitiesController < ApplicationController
  before_filter :find_facility, only: [:show, :edit, :update]
  before_filter :initialize_times, only: [:new, :edit]
  def new
      @facility = Facility.new
  end

  def create
      @facility = Facility.new(facility_params)
      if @facility.save
          redirect_to facility_path(@facility.id), notice: "Facility created"
      else
          redirect_to new_facilities_path, alert: "Error creating facility."
      end
  end

  def show
      # @weeks = AssignmentsWeek.order(created_at: :desc).map{|item| [item.to_s, item.id]}
      # @chosen_week = get_chosen_week(@weeks, params)
      # @facility_hash = @facility.assignments_hash(@chosen_week)
  end

  def edit
  end

  def update
    if @facility.update(facility_params)
      redirect_to @facility
    else
      render facilities_edit_path(@facility.id)
    end
  end

  def index
    @facilities = Facility.all
  end

  def facility_params
     params.require(:facility).permit(:name, :spots, :su_start, :su_end, :m_start, :m_end, :tu_start, :tu_end, :w_start, :w_end, :th_start, :th_end, :f_start, :f_end, :sa_start, :sa_end, :comments)
  end

  def find_facility
    @facility = Facility.find(params[:id])
  end

  def initialize_times
    times = get_all_times
    @start_times = ["Select Start Time"] + times
    @end_times = ["Select End Time"] + times
  end

end
