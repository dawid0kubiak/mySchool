class PupilsController < ApplicationController
  before_action :set_pupil, only: %i[show edit update destroy subjects addsubjects addgrade]

  # GET /pupils
  # GET /pupils.json
  def index
    @pupils = Pupil.all.order(:lastname, :name)
    authorize @pupils
  end

  # GET /pupils/1
  # GET /pupils/1.json
  def show
    puts
  end

  # GET /pupils/new
  def new
    @pupil = Pupil.new
    authorize @pupil
  end

  # GET /pupils/1/edit
  def edit; end

  # POST /pupils
  # POST /pupils.json
  def create
    @pupil = Pupil.new(pupil_params)
    authorize @pupil

    respond_to do |format|
      if @pupil.save
        format.html { redirect_to @pupil, notice: 'Pupil was successfully created.' }
        format.json { render :show, status: :created, location: @pupil }
      else
        format.html { render :new }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pupils/1
  # PATCH/PUT /pupils/1.json
  def update
    respond_to do |format|
      if @pupil.update(pupil_params)
        format.html { redirect_to @pupil, notice: 'Pupil was successfully updated.' }
        format.json { render :show, status: :ok, location: @pupil }
      else
        format.html { render :edit }
        format.json { render json: @pupil.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pupils/1
  # DELETE /pupils/1.json
  def destroy
    @pupil.destroy
    respond_to do |format|
      format.html { redirect_to pupils_url, notice: 'Pupil was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def subjects
    @subjects = Subject.all
    authorize @subjects
  end

  def addsubjects
    subjects = params[:subjects]
    @pupil.subjects = Subject.where(id: subjects)
    authorize @pupil
    redirect_to edit_pupil_path(@pupil)
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_pupil
    id_pupil = params[:id].nil? ? params[:pupil_id] : params[:id]
    @pupil = Pupil.find(id_pupil)
    authorize @pupil
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def pupil_params
    params.require(:pupil).permit(:name, :lastname, :note)
  end
end
