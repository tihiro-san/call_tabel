class Contact < ApplicationRecord

  has_many :contact_managers, dependent: :destroy
  has_many :users, through: :contact_managers

  has_many :call_histories, dependent: :destroy


  enum status: { not_yet: false, already_exist: true }
  #validates :status, inclusion: { in: ["existence", "invalid"] }
end
