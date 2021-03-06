class ExamSchedulesController < ApplicationController
  before_action :set_exam_schedule, only: [:show, :edit, :update, :destroy]

  # GET /exam_schedules
  # GET /exam_schedules.json
  def index
    @exam_schedules = ExamSchedule.all
  end

  # GET /exam_schedules/1
  # GET /exam_schedules/1.json
  def show
  end

  # GET /exam_schedules/new
  def new
    @exam_schedule = ExamSchedule.new
  end

  # GET /exam_schedules/1/edit
  def edit
  end

  # POST /exam_schedules
  # POST /exam_schedules.json
  def create
    @exam_schedule = SubjectAssignment.find(subject_id).exam_schedules.build(exam_schedule_params)

    respond_to do |format|
      if @exam_schedule.save
        format.html { redirect_to subject_assignment_path(id: subject_id), notice: 'Exam schedule was successfully created.' }
        format.json { render :show, status: :created, location: @exam_schedule }
      else
        format.html { render :new }
        format.json { render json: @exam_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /exam_schedules/1
  # PATCH/PUT /exam_schedules/1.json
  def update
    respond_to do |format|
      if @exam_schedule.update(exam_schedule_params)
        format.html { redirect_to @exam_schedule, notice: 'Exam schedule was successfully updated.' }
        format.json { render :show, status: :ok, location: @exam_schedule }
      else
        format.html { render :edit }
        format.json { render json: @exam_schedule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /exam_schedules/1
  # DELETE /exam_schedules/1.json
  def destroy
    @exam_schedule.destroy
    respond_to do |format|
      format.html { redirect_to subject_assignment_path(id: subject_id), notice: 'Exam schedule was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_exam_schedule
      @exam_schedule = ExamSchedule.find(params[:id])
    end

    def subject_id
       params[:subject_assignment_id]
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def exam_schedule_params
      params.fetch(:exam_schedule).permit(:title, :details, :start_date, :end_date)
    end
end
