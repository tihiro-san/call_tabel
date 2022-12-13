class ContactManager < ApplicationRecord

  belongs_to :user_state
  
  belongs_to :contact

end
