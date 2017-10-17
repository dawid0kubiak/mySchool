class PupilGradesController < ApplicationController
  before_action :set_pupil_grade, only: [:show, :edit, :update, :destroy]

  # GET /pupil_grades
  # GET /pupil_grades.json
  def index
    @pupil = Pupil.find(params[:pupil_id])
    @subject = Subject.find(params[:subject_id])
    @pupil_grades = @pupil.pupils_grades.where(subject_id: params[:subject_id])
    authorize @pupil_grades
  end

  # GET /pupil_grades/1
  # GET /pupil_grades/1.json
  def show
  end

  # GET /pupil_grades/new
  def new
    @pupil_grade = PupilGrade.new
  end

  # GET /pupil_grades/1/edit
  def edit
  end

  # POST /pupil_grades
  # POST /pupil_grades.json
  def create
    @pupil_grade = PupilGrade.new(pupil_grade_params)

    respond_to do |format|
      if @pupil_grade.save
        format.html { redirect_to @pupil_grade, notice: 'Pupil grade was successfully created.' }
        format.json { render :show, status: :created, location: @pupil_grade }
      else
        format.html { render :new }
        format.json { render json: @pupil_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pupil_grades/1
  # PATCH/PUT /pupil_grades/1.json
  def update
    respond_to do |format|
      if @pupil_grade.update(pupil_grade_params)
        format.html { redirect_to @pupil_grade, notice: 'Pupil grade was successfully updated.' }
        format.json { render :show, status: :ok, location: @pupil_grade }
      else
        format.html { render :edit }
        format.json { render json: @pupil_grade.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pupil_grades/1
  # DELETE /pupil_grades/1.json
  def destroy
    @pupil_grade.destroy
    respond_to do |format|
      format.html { redirect_to pupil_grades_url, notice: 'Pupil grade was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pupil_grade
      @pupil_grade = PupilGrade.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def pupil_grade_params
      params.fetch(:pupil_grade, {})
    end
end
