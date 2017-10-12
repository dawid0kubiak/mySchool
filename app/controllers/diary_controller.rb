class DiaryController < ApplicationController
  def index
    @subjects = Subject.all.order(:name)
    authorize @subjects
  end

  def view
    session[:subject_id] = params[:subject_id] unless params[:subject_id].nil?
    @subject = Subject.find(session[:subject_id])
    authorize @subject
    @pupils = Pupil.all.order(:lastname, :name)
    @sum_array = Array.new
  end

  def addgrade
    pupil = Pupil.find(subject_params[:pupil_id])
    authorize pupil
    subject_id = (subject_params[:subject_id]).to_i
    grade_id = (subject_params[:grade_id]).to_i
    pupil.pupils_grades.create(subject_id: subject_id,
                               grade_id: grade_id)
    redirect_to diary_view_path
  end

  def subjects
    @subjects = Subject.all
    authorize @subjects
  end

  private

  def subject_params
    params.require(:subject).permit(:grade_id, :pupil_id, :subject_id)
  end
end
