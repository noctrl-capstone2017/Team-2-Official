module SessionsHelper
  # Steven Royster: Implemented teacher functionality similar to that of sample_app for users
  
  # Logs in the given user.
  def log_in(teacher)
    session[:teacher_id] = teacher.id
  end

  # Remembers a user in a persistent session.
  def remember(teacher)
    teacher.remember
    cookies.permanent.signed[:teacher_id] = teacher.id
    cookies.permanent[:remember_token] = teacher.remember_token
  end

  # Returns true if the given user is the current user.
  def current_teacher?(teacher)
    teacher == current_teacher
  end
  
  # Returns the current logged-in user (if any).
  def current_teacher
    if (teacher_id = session[:teacher_id])
      @current_teacher ||= Teacher.find_by(id: teacher_id)
    elsif (teacher_id = cookies.signed[:teacher_id])
      teacher = Teacher.find_by(id: teacher_id)
      if teacher && teacher.authenticated?(:remember, cookies[:remember_token])
        log_in teacher
        @current_teacher = teacher
      end
    end
  end


  # Returns true if the user is logged in, false otherwise.
  def logged_in?
    !current_teacher.nil?
  end

  # Logs out the current user.
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Forgets a persistent session.
  def forget(user)
    user.forget
    cookies.delete(:user_id)
    cookies.delete(:remember_token)
  end

  # Logs out the current user.
  def log_out
    forget(current_user)
    session.delete(:user_id)
    @current_user = nil
  end
  
  # Redirects to stored location (or to the default).
  def redirect_back_or(default)
    redirect_to(session[:forwarding_url] || default)
    session.delete(:forwarding_url)
  end

  # Stores the URL trying to be accessed.
  def store_location
    session[:forwarding_url] = request.original_url if request.get?
  end
end
