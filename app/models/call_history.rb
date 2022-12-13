class CallHistory < ApplicationRecord
  
  belongs_to :user
  
  belongs_to :contact
  
  belongs_to :valuatuon

end
