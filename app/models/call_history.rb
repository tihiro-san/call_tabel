class CallHistory < ApplicationRecord
  
  belongs_to :user
  
  belongs_to :contact
  
  belongs_to :valuation, optional: true

  validates :content, presence: true

  validates :date_and_time, presence: true

end
