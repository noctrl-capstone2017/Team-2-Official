class RosterStudentsController < ApplicationController
  before_action :set_roster_student, only: [:show, :edit, :update, :destroy]

  # GET /roster_students
  # GET /roster_students.json
  def index
    @roster_students = RosterStudent.all
  end

  # GET /roster_students/1
  # GET /roster_students/1.json
  def show
  end

  # GET /roster_students/new
  def new
    @roster_student = RosterStudent.new
  end

  # GET /roster_students/1/edit
  def edit
  end

  # POST /roster_students
  # POST /roster_students.json
  def create
    @roster_student = RosterStudent.new(roster_student_params)

    respond_to do |format|
      if @roster_student.save
        format.html { redirect_to @roster_student, notice: 'Roster student was successfully created.' }
        format.json { render :show, status: :created, location: @roster_student }
      else
        format.html { render :new }
        format.json { render json: @roster_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /roster_students/1
  # PATCH/PUT /roster_students/1.json
  def update
    respond_to do |format|
      if @roster_student.update(roster_student_params)
        format.html { redirect_to @roster_student, notice: 'Roster student was successfully updated.' }
        format.json { render :show, status: :ok, location: @roster_student }
      else
        format.html { render :edit }
        format.json { render json: @roster_student.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /roster_students/1
  # DELETE /roster_students/1.json
  def destroy
    @roster_student.destroy
    respond_to do |format|
      format.html { redirect_to roster_students_url, notice: 'Roster student was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_roster_student
      @roster_student = RosterStudent.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def roster_student_params
      params.require(:roster_student).permit(:student_id, :teacher_id)
    end
end
