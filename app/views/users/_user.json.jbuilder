json.extract! user, :id, :identification, :name, :last_name, :email, :password_digest, :birth_date, :status, :phone, :rol_id, :created_at, :updated_at
json.url user_url(user, format: :json)