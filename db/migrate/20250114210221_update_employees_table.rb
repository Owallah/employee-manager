class UpdateEmployeesTable < ActiveRecord::Migration[7.1]
  def change
    rename_column :employees, :contact_info, :email

    add_column :employees, :phone_number, :string
    add_column :employees, :employee_id, :string
    add_column :employees, :emergency_contact, :string
    add_column :employees, :date_of_joining, :date

    # add_index :employees, :employee_id, unique: true
  end
end
