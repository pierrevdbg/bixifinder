class BixisController < ApplicationController
  before_action :set_bixi, only: [:show, :edit, :update, :destroy]

  # GET /bixis
  # GET /bixis.json
  def index
    Bixi.update_bike_stations_status
    @closest_available_bike = Bixi.closest_available_bike
    
    puts @closest_available_bike[:distance].inspect
    @bixis = Bixi.all.order(nbBikes: :desc)   
  end

  # GET /bixis/1
  # GET /bixis/1.json
  def show
  end

  # GET /bixis/new
  def new
    @bixi = Bixi.new
  end

  # GET /bixis/1/edit
  def edit
  end

  # POST /bixis
  # POST /bixis.json
  def create
    @bixi = Bixi.new(bixi_params)

    respond_to do |format|
      if @bixi.save
        format.html { redirect_to @bixi, notice: 'Bixi was successfully created.' }
        format.json { render :show, status: :created, location: @bixi }
      else
        format.html { render :new }
        format.json { render json: @bixi.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bixis/1
  # PATCH/PUT /bixis/1.json
  def update
    respond_to do |format|
      if @bixi.update(bixi_params)
        format.html { redirect_to @bixi, notice: 'Bixi was successfully updated.' }
        format.json { render :show, status: :ok, location: @bixi }
      else
        format.html { render :edit }
        format.json { render json: @bixi.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bixis/1
  # DELETE /bixis/1.json
  def destroy
    @bixi.destroy
    respond_to do |format|
      format.html { redirect_to bixis_url, notice: 'Bixi was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bixi
      @bixi = Bixi.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bixi_params
      params.require(:bixi).permit(:station_id, :name, :terminalName, :lastCommWithServer, :lat, :long, :installed, :locked, :installDate, :removalDate, :temporary, :public, :nbBikes, :nbEmptyDocks, :lastUpdateTime)
    end
end
