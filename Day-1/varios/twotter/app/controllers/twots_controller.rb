class TwotsController < ApplicationController
  before_action :set_twot, only: [:show, :edit, :update, :destroy]

  # GET /twots
  # GET /twots.json
  def index
    @twots = Twot.all
  end

  # GET /twots/1
  # GET /twots/1.json
  def show
  end

  # GET /twots/new
  def new
    @twot = Twot.new
  end

  # GET /twots/1/edit
  def edit
  end

  # POST /twots
  # POST /twots.json
  def create
    @twot = Twot.new(twot_params)

    respond_to do |format|
      if @twot.save
        format.html { redirect_to @twot, notice: 'Twot was successfully created.' }
        format.json { render :show, status: :created, location: @twot }
      else
        format.html { render :new }
        format.json { render json: @twot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /twots/1
  # PATCH/PUT /twots/1.json
  def update
    respond_to do |format|
      if @twot.update(twot_params)
        format.html { redirect_to @twot, notice: 'Twot was successfully updated.' }
        format.json { render :show, status: :ok, location: @twot }
      else
        format.html { render :edit }
        format.json { render json: @twot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /twots/1
  # DELETE /twots/1.json
  def destroy
    @twot.destroy
    respond_to do |format|
      format.html { redirect_to twots_url, notice: 'Twot was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_twot
      @twot = Twot.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def twot_params
      params.require(:twot).permit(:body)
    end
end
