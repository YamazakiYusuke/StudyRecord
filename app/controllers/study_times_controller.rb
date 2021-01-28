class StudyTimesController < ApplicationController
  before_action :authenticate_user
  before_action :set_study_time, only: [:edit, :update, :destroy]

  def index
    user_study_time = current_user.study_times
    study_times = user_study_time.group_by {|p| [p[:date]]}
    @study_times = study_times.sort.reverse.to_h
    @sum_time = user_study_time.sum { |hash| hash[:time_length]}
    @sum_date = @study_times.size
  end

  def show
    @date = params[:id]
    @study_times = current_user.study_times.where(date: @date)
  end

  def new
    @study_time = StudyTime.new
  end

  def edit
  end

  def create
    @study_time = current_user.study_times.build(study_time_params) 
    respond_to do |format|
      if @study_time.save
        format.html { redirect_to study_times_path, notice: 'Study time was successfully created.' }
        format.json { render :show, status: :created, location: @study_time }
      else
        format.html { render :new }
        format.json { render json: @study_time.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @study_time.update(study_time_params)
        format.html { redirect_to study_time_path(@study_time.date), notice: 'Study time was successfully updated.' }
        format.json { render :show, status: :ok, location: @study_time }
      else
        format.html { render :edit }
        format.json { render json: @study_time.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @study_time.destroy
    respond_to do |format|
      binding.pry
      format.html { redirect_to study_time_path(@study_time.date), notice: 'Study time was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_study_time
      @study_time = StudyTime.find(params[:id])
    end

    def study_time_params
      params.require(:study_time).permit(:time_length, :date, :comment)
    end
end
