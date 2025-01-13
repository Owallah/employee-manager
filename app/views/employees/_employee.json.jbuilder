json.extract! employee, :id, :full_name, :contact_info, :position, :department, :status, :created_at, :updated_at
json.url employee_url(employee, format: :json)
