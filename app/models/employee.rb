class Employee < ApplicationRecord
  # before_create :generate_employee_id
  validates :full_name, :email, :phone_number, :position, :department, :employee_id, :emergency_contact, presence: true
  validates :status, inclusion: { in: ['Pending Verification', 'Verified'] }
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, message: "is not a valid email" }
  validates :employee_id, uniqueness: true

  

  # private

  def generate_employee_id
    self.employee_id ||= SecureRandom.hex(4).upcase
  end
end

