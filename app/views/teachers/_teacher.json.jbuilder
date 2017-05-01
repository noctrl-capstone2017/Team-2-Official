json.extract! teacher, :id, :user_name, :teacher_icon_name, :teacher_name, :teacher_email, :admin_powers, :analysis_powers, :teacher_description, :color, :school_id, :teacher_password, :teacher_password_confirmation, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)
