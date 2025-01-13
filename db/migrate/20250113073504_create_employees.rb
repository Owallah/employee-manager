class CreateEmployees < ActiveRecord::Migration[7.1]
  def change
    create_table :employees do |t|
      t.string :full_name
      t.string :contact_info
      t.string :position
      t.string :department
      t.string :status

      t.timestamps
    end
  end
end
