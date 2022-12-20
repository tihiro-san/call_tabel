class Contact < ApplicationRecord
  
  has_many :contact_managers, dependent: :destroy
  has_many :users, through: :contact_managers
  
  has_many :call_histories, dependent: :destroy
  
  
  enum contact_status: { existence: 0, invalid: 1 }, _prefix: true
  
end
