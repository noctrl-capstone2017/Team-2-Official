class LoginSessionController < ApplicationController
  before_action :set_session, only: [:show, :edit, :update, :destroy]

  def index
    @sessions = Session.all
  end


  def show
  end

  def new
    @session = Session.new
  end

  def edit
  end

  def create
    @session = Session.new(session_params)
    
    teacher = Teacher.find_by(:user_name => params[:session][:user_name].downcase)
    if teacher && teacher.authenticate(params[:session][:teacher_password])
      if teacher.activated?
        log_in teacher
        params[:session][:remember_me] == '1' ? remember(teacher) : forget(teacher)
        redirect_back_or teacher
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
      flash.now[:danger] = 'Invalid email/password combination'
      render 'new'
    end
  end
  
  def update
  end

  def destroy
    @session.destroy
    
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