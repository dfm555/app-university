json.extract! teacher, :id, :code, :identification, :full_name, :date_of_birth, :email, :office, :phone_number, :amount_hour, :created_at, :updated_at
json.url teacher_url(teacher, format: :json)