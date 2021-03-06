class SessionsController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  # GET /sessions
  # GET /sessions.json
  def index
    @sessions = Session.all
  end

  # GET /sessions/1
  # GET /sessions/1.json
  def show
    @student = Student.find(@session.session_student)
    if params[:end_session]
      
      respond_to do |format|
        if @session.update()
          format.html { redirect_to @session, notice: 'Session was successfully updated.' }
          format.json { render :end, status: :ok, location: @session }
        end
      end
    end
  end

  def end_session
  end

  # GET /sessions/new
  def new
    @session = Session.new
  end

  # GET /sessions/1/edit
  def edit
  end

  # POST /sessions
  # POST /sessions.json
  def create
    @session = Session.new(session_params)  
    
    # Steven Royster: Thank you previous capstone class. (Does not authenticate properly yet...) 
    teacher = Teacher.where(:user_name => params[:session][:user_name].downcase).first
    if teacher && teacher.authenticate(params[:session][:teacher_password])
      log_in teacher
      teacher['last_login'] = Time.now.to_datetime
      teacher.save
      flash[:success] = "Welcome back #{teacher.user_name}!"
      redirect_to login_path
    else
      # Otherwise, keep them on the login page.
      flash.now[:danger] = 'Invalid username or password'
      render 'new'
    end
    
      # respond_to do |format|
      #   if @session.save
      #     format.html { redirect_to @session, notice: 'Session was successfully created.' }
      #     format.json { render :show, status: :created, location: @session }
      #   else
      #     format.html { render :new }
      #     format.json { render json: @session.errors, status: :unprocessable_entity }
      #   end
      # end
  end

  # PATCH/PUT /sessions/1
  # PATCH/PUT /sessions/1.json
  def update
    respond_to do |format|
      if @session.update(session_params)
        format.html { redirect_to @session, notice: 'Session was successfully updated.' }
        format.json { render :show, status: :ok, location: @session }
      else
        format.html { render :edit }
        format.json { render json: @session.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sessions/1
  # DELETE /sessions/1.json
  def destroy
    @session.destroy
    respond_to do |format|
      format.html { redirect_to sessions_url, notice: 'Session was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_session
      @session = Session.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def session_params
      params.require(:session).permit(:start_time, :end_time, :session_teacher, :session_student)
    end
end
