json.extract! student, :id, :code, :identification, :full_name, :date_of_birth, :email, :phone_number, :created_at, :updated_at
json.url student_url(student, format: :json)