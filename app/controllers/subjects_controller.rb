class SubjectsController < ApplicationController
  def index
    @subjects = Subject.all
  end

  def show

  end

  def new
    @subject = Subject.new
  end

  def create
    @subject = Subject.new(subject_params)

    respond_to do |format|
      if @subject.save
        format.html { redirect_to @subject, notice: "Subject successfully created." }
      else
        format.html { redirect_to :new }
      end
    end
  end

  private
    def subject_params
      params.require(:subject).permit(:name, :code)
    end
end
