class PupilsGradeController < ApplicationController
  before_action :set_pupil_subjest
  before_action :set_pupil_grade, only: :destroy

  # GET /pupils_grade
  # GET /pupils_grade.json
  def index
    @pupil_grades = @pupil.pupils_grades.where(subject_id: params[:subject_id])
    authorize @pupil_grades
  end


  # DELETE /pupils_grade/1
  # DELETE /pupils_grade/1.json
  def destroy
    @pupils_grade.destroy
    authorize @pupils_grade
    respond_to do |format|
      format.html { redirect_to pupil_subject_pupils_grade_index_path, notice: "Ocena \"#{@pupils_grade.grade.short_name}\" ucznia #{@pupil.name} #{@pupil.lastname} z przedmiotu #{@subject.name} została usunięta" }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pupil_grade
      @pupils_grade = PupilsGrade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pupil_grade_params
      params.fetch(:pupil_grade, {})
    end

  def set_pupil_subjest
    @pupil = Pupil.find(params[:pupil_id])
    @subject = Subject.find(params[:subject_id])
  end
end
