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


  def listgrades
    get_pupil
  end

  def addgrade
    get_pupil.pupils_grades.create(subject_id: subject_params[:subject_id],
                                   grade_id: subject_params[:grade_id])
    redirect_to diary_view_path
  end

  def delgrade

    get_pupil.pupils_grades.find(5).destroy
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

  def get_pupil
    pupil = Pupil.find(subject_params[:pupil_id])
    authorize pupil
    pupil
  end
end
