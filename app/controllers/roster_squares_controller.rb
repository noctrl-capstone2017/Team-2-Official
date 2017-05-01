class RosterSquaresController < ApplicationController
  before_action :set_roster_square, only: [:show, :edit, :update, :destroy]

  # GET /roster_squares
  # GET /roster_squares.json
  def index
    @roster_squares = RosterSquare.all
  end

  # GET /roster_squares/1
  # GET /roster_squares/1.json
  def show
  end

  # GET /roster_squares/new
  def new
    @roster_square = RosterSquare.new
  end

  # GET /roster_squares/1/edit
  def edit
  end

  # POST /roster_squares
  # POST /roster_squares.json
  def create
    @roster_square = RosterSquare.new(roster_square_params)

    respond_to do |format|
      if @roster_square.save
        format.html { redirect_to @roster_square, notice: 'Roster square was successfully created.' }
        format.json { render :show, status: :created, location: @roster_square }
      else
        format.html { render :new }
        format.json { render json: @roster_square.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roster_squares/1
  # PATCH/PUT /roster_squares/1.json
  def update
    respond_to do |format|
      if @roster_square.update(roster_square_params)
        format.html { redirect_to @roster_square, notice: 'Roster square was successfully updated.' }
        format.json { render :show, status: :ok, location: @roster_square }
      else
        format.html { render :edit }
        format.json { render json: @roster_square.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roster_squares/1
  # DELETE /roster_squares/1.json
  def destroy
    @roster_square.destroy
    respond_to do |format|
      format.html { redirect_to roster_squares_url, notice: 'Roster square was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roster_square
      @roster_square = RosterSquare.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roster_square_params
      params.require(:roster_square).permit(:square_id, :student_id)
    end
end
