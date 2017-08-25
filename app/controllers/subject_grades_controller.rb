class SubjectGradesController < ApplicationController
  before_action :set_subject_grade, only: [:show, :edit, :update, :destroy]

  # GET /subject_grades
  # GET /subject_grades.json
  def index
    @subject_grades = SubjectGrade.where(subject_id: current_page_subject_id)
  end

  # GET /subject_grades/1
  # GET /subject_grades/1.json
  def show
  end

  # GET /subject_grades/new
  def new
    @subject_grade = SubjectGrade.new
  end

  # GET /subject_grades/1/edit
  def edit
  end

  # POST /subject_grades
  # POST /subject_grades.json
  def create
    @subject_grade = SubjectGrade.new(subject_grade_params)

    respond_to do |format|
      if @subject_grade.save
        format.html { redirect_to @subject_grade, notice: 'Subject grade was successfully created.' }
        format.json { render :show, status: :created, location: @subject_grade }
      else
        format.html { render :new }
        format.json { render json: @subject_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_grades/1
  # PATCH/PUT /subject_grades/1.json
  def update
    respond_to do |format|
      if @subject_grade.update(subject_grade_params)
        format.html { redirect_to @subject_grade, notice: 'Subject grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject_grade }
      else
        format.html { render :edit }
        format.json { render json: @subject_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_grades/1
  # DELETE /subject_grades/1.json
  def destroy
    @subject_grade.destroy
    respond_to do |format|
      format.html { redirect_to subject_grades_url, notice: 'Subject grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_grade
      @subject_grade = SubjectGrade.find(params[:id])
    end

    def current_page_subject_id
      SubjectAssignment.find(params[:subject_assignment_id]).subject.id
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_grade_params
      params.fetch(:subject_grade, {})
    end
end
