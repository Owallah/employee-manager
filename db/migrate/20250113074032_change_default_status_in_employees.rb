class ChangeDefaultStatusInEmployees < ActiveRecord::Migration[7.1]
  def change
    change_column_default :employees, :status, from: nil, to: 'Pending Verification'
  end
end

