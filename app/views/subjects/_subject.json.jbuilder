json.extract! subject, :id, :code, :name, :credits, :cycle, :room, :description, :hours, :created_at, :updated_at
json.url subject_url(subject, format: :json)