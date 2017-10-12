class TeachersController < ApplicationController
  before_action :set_teacher, only: %i[show edit update destroy]

  # GET /teachers
  # GET /teachers.json
  def index
    @teachers = User.where(role: :teacher)
    authorize @teachers
  end


  private

  # Use callbacks to share common setup or constraints between actions.
  def set_teacher
    @teacher = Teacher.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def teacher_params
    params.require(:teacher).permit(:name, :lastname, :email, :phone)
  end
end
