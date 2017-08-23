class SubjectAssignmentsController < ApplicationController
  before_action :set_subject_assignment, only: [:show, :edit, :update, :destroy]

  # GET /subject_assignments
  # GET /subject_assignments.json
  def index
    @subject_assignments = SubjectAssignment.all
  end

  # GET /subject_assignments/1
  # GET /subject_assignments/1.json
  def show
  end

  # GET /subject_assignments/new
  def new
    @subject_assignment = SubjectAssignment.new
  end

  # GET /subject_assignments/1/edit
  def edit
  end

  # POST /subject_assignments
  # POST /subject_assignments.json
  def create
    @subject_assignment = SubjectAssignment.new(subject_assignment_params)

    respond_to do |format|
      if @subject_assignment.save
        format.html { redirect_to @subject_assignment, notice: 'Subject assignment was successfully created.' }
        format.json { render :show, status: :created, location: @subject_assignment }
      else
        format.html { render :new }
        format.json { render json: @subject_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /subject_assignments/1
  # PATCH/PUT /subject_assignments/1.json
  def update
    respond_to do |format|
      if @subject_assignment.update(subject_assignment_params)
        format.html { redirect_to @subject_assignment, notice: 'Subject assignment was successfully updated.' }
        format.json { render :show, status: :ok, location: @subject_assignment }
      else
        format.html { render :edit }
        format.json { render json: @subject_assignment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /subject_assignments/1
  # DELETE /subject_assignments/1.json
  def destroy
    @subject_assignment.destroy
    respond_to do |format|
      format.html { redirect_to subject_assignments_url, notice: 'Subject assignment was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_subject_assignment
      @subject_assignment = SubjectAssignment.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def subject_assignment_params
      params.fetch(:subject_assignment, {})
    end
end
