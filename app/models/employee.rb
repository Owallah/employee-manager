class Employee < ApplicationRecord
  validates :full_name, :contact_info, :position, :department, presence: true
  validates :status, inclusion: { in: ['Pending Verification', 'Verified'] }

  before_create :set_default_status

  private

  def set_default_status
    self.status ||= 'Pending Verification'
  end
end

