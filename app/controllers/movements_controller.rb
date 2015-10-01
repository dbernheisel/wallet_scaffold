class MovementsController < ApplicationController
  before_action :set_movement, only: [:show, :edit, :update, :destroy]

  # GET /movements
  def index
    @movements = Movement.all
  end

  # GET /movements/1
  def show
    @movement = set_movement
  end

  # GET /movements/new
  def new
    @movement = Movement.new
  end

  # GET /movements/1/edit
  def edit
    @movement = set_movement
  end

  # POST /movements
  def create
    @movement = Movement.new(movement_params)

    if @movement.save
      redirect_to @movement, notice: 'Movement was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /movements/1
  def update
    if @movement.update(movement_params)
      redirect_to @movement, notice: 'Movement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /movements/1
  def destroy
    @movement.destroy
    redirect_to movements_url, notice: 'Movement was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_movement
      @movement = Movement.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def movement_params
      params.require(:movement).permit(:amount, :account_id, :description, :other_party)
    end
end
