class AbsenceTypesController < ApplicationController
  before_action :set_absence_type, only: [:show, :edit, :update, :destroy]

  # GET /absence_types
  # GET /absence_types.json
  def index
    @absence_types = AbsenceType.all
    authorize @absence_types
  end

  # GET /absence_types/1
  # GET /absence_types/1.json
  def show
  end

  # GET /absence_types/new
  def new
    @absence_type = AbsenceType.new
    authorize @absence_type
  end

  # GET /absence_types/1/edit
  def edit
  end

  # POST /absence_types
  # POST /absence_types.json
  def create
    @absence_type = AbsenceType.new(absence_type_params)
    authorize @absence_type

    respond_to do |format|
      if @absence_type.save
        format.html { redirect_to @absence_type, notice: 'Absence type was successfully created.' }
        format.json { render :show, status: :created, location: @absence_type }
      else
        format.html { render :new }
        format.json { render json: @absence_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /absence_types/1
  # PATCH/PUT /absence_types/1.json
  def update
    respond_to do |format|
      if @absence_type.update(absence_type_params)
        format.html { redirect_to @absence_type, notice: 'Absence type was successfully updated.' }
        format.json { render :show, status: :ok, location: @absence_type }
      else
        format.html { render :edit }
        format.json { render json: @absence_type.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /absence_types/1
  # DELETE /absence_types/1.json
  def destroy
    @absence_type.destroy
    respond_to do |format|
      format.html { redirect_to absence_types_url, notice: 'Absence type was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_absence_type
      @absence_type = AbsenceType.find(params[:id])
      authorize @absence_type
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def absence_type_params
      params.require(:absence_type).permit(:short_name, :long_name)
    end
end
