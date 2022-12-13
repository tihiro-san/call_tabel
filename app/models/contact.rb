class Contact < ApplicationRecord
  
  has_many :contact_managers, dependent: :destroy
  
  has_many :call_histories, dependent: :destroy
  
end
